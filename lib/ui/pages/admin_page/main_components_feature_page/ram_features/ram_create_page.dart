import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/ram/ram_controller.dart';
import 'package:buildpc/controller/ram/ram_memory_type_controller.dart';
import 'package:buildpc/controller/ram/ram_timings_controller.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/ram/ram_memory_type_repository.dart';
import 'package:buildpc/repository/ram/ram_repository.dart';
import 'package:buildpc/repository/ram/ram_timings_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class RamCreatePage extends StatelessWidget {
  const RamCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Ram';
    final component = Component();
    final text = component.getComponents(context)[modelName];
    final screenSize = MediaQuery.of(context).size;

    //final modelMap = model.toJson();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: SafeArea(
        child: _MainView(
          modelName: modelName,
          modelList: text,
        ),
      ),
    );
  }
}

class _MainView extends StatefulWidget {
  final List<String>? modelList;
  final String? modelName;

  const _MainView({Key? key, required this.modelList, this.modelName})
      : super(key: key);

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  ModelController get _modelList => context.read<ModelController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getModels();
    });
    super.initState();
  }

  Future<void> getModels() async {
    final producerController = ProducersController(ProducersRepository());
    final ramMemoryTypeController =
        RamMemoryTypeController(RamMemoryTypeRepository());
    final ramTimingsController = RamTimingsController(RamTimingsRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final ramMemoryType = await ramMemoryTypeController.getList();
    final ramTimings = await ramTimingsController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('RamMemoryTypes', ramMemoryType);
      _modelList.addNewKV(
        'RamTimings',
        ramTimings,
      );
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final ramController = RamController(RamRepository());

  final nameController = TextEditingController(text: '');
  final memoryCapacityController = TextEditingController(text: '');
  final frequencyController = TextEditingController(text: '');
  final powerSupplyVoltageController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  RamMemoryType? pickedRamMemoryType;
  RamTimings? pickedRamTimings;
  PerformanceLevel? pickedPerformanceLevel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelList = widget.modelList;
    modelList?.remove('id');
    final modelLength = modelList?.length ?? 0;
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel('Ram', context);
    final _fieldProvider = context.read<FieldController>();

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              width: screenSize.width * 0.5,
              height: 100,
              child: Text(
                '${_locale?.create} "$translate"',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBorder(),
                Expanded(
                  flex: 2,
                  child: ModelListView(
                    modelList: modelList,
                    itemCount: modelLength,
                  ),
                ),
                const CustomBorder(),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'name'),
                        controller: nameController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.producer}'),
                        items: _modelList.modelMap['Producers']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedProducer = newVal as Producers?;
                          });
                        },
                        value: pickedProducer,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.ramMemoryType}'),
                        items:
                            _modelList.modelMap['RamMemoryTypes']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedRamMemoryType = newVal as RamMemoryType?;
                          });
                        },
                        value: pickedRamMemoryType,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '${_locale?.memoryCapacity}',),
                        controller: memoryCapacityController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.frequency}',
                        ),
                        controller: frequencyController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.ramTimings}'),
                        items: _modelList.modelMap['RamTimings']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedRamTimings = newVal as RamTimings?;
                          });
                        },
                        value: pickedRamTimings,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '${_locale?.powerSupplyVoltage}',),
                        controller: powerSupplyVoltageController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.description}',
                        ),
                        controller: descriptionController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.recommendedPrice}',
                        ),
                        controller: recommendedPriceController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.performanceLevel}'),
                        items: _modelList.modelMap['PerformanceLevels']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedPerformanceLevel =
                                newVal as PerformanceLevel?;
                          });
                        },
                        value: pickedPerformanceLevel,
                      ),
                    ],
                  ),
                ),
                const CustomBorder(),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  final ram = Ram(
                    id: null,
                    name: nameController.text,
                    producer: pickedProducer,
                    memoryType: pickedRamMemoryType,
                    memoryCapacity: int.parse(memoryCapacityController.text),
                    frequency: int.parse(frequencyController.text),
                    timings: pickedRamTimings,
                    powerSupplyVoltage:
                        double.parse(powerSupplyVoltageController.text),
                    description: descriptionController.text,
                    recommendedPrice: int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await ramController.postData(ram);
                  // Очищает список полей
                  _fieldProvider.deleteFields();
                },
                child: Text('${_locale?.submit}', style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

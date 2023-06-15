import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/storage/hdd_controller.dart';
import 'package:buildpc/controller/storage/storage_form_factor_controller.dart';
import 'package:buildpc/controller/storage/storage_interface_controller.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/storage/hdd_repository.dart';
import 'package:buildpc/repository/storage/storage_form_factor_repository.dart';
import 'package:buildpc/repository/storage/storage_interface_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class HddCreatePage extends StatelessWidget {
  const HddCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Hdd';
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
    final storageFormFactorController =
        StorageFormFactorController(StorageFormFactorRepository());
    final storageInterfaceController =
        StorageInterfaceController(StorageInterfaceRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final storageFormFactor = await storageFormFactorController.getList();
    final storageInterface = await storageInterfaceController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('StorageFormFactors', storageFormFactor);
      _modelList.addNewKV('StorageInterfaces', storageInterface);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final hddController = HddController(HddRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final storageSizeController = TextEditingController(text: '');
  final speedController = TextEditingController(text: '');
  final bufferSizeController = TextEditingController(text: '');
  final readingSpeedController = TextEditingController(text: '');
  final writingSpeedController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  StorageFormFactor? pickedFormFactor;
  StorageInterface? pickedStorageInterface;
  PerformanceLevel? pickedPerformanceLevel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelLength = widget.modelList?.length ?? 0;
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
                '${_locale?.create} ${widget.modelName}',
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
                    modelList: widget.modelList,
                    itemCount: modelLength,
                  ),
                ),
                const CustomBorder(),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'id'),
                        controller: idController,
                      ),
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
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.storageSize}',
                        ),
                        controller: storageSizeController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.speed}',
                        ),
                        controller: speedController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.storageFormFactor}'),
                        items: _modelList.modelMap['StorageFormFactors']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedFormFactor = newVal as StorageFormFactor?;
                          });
                        },
                        value: pickedFormFactor,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.storageInterface}'),
                        items: _modelList.modelMap['StorageInterfaces']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedStorageInterface =
                                newVal as StorageInterface?;
                          });
                        },
                        value: pickedStorageInterface,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.bufferSize}',
                        ),
                        controller: bufferSizeController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.readingSpeed}',
                        ),
                        controller: readingSpeedController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.writingSpeed}',
                        ),
                        controller: writingSpeedController,
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
            ElevatedButton(
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
                final hdd = Hdd(
                  id: int.parse(idController.text),
                  name: nameController.text,
                  producer: pickedProducer,
                  storageSize: int.parse(storageSizeController.text),
                  speed: int.parse(speedController.text),
                  formFactor: pickedFormFactor,
                  storageInterface: pickedStorageInterface,
                  bufferSize: int.parse(bufferSizeController.text),
                  readingSpeed: int.parse(readingSpeedController.text),
                  writingSpeed: int.parse(writingSpeedController.text),
                  description: descriptionController.text,
                  recommendedPrice: int.parse(recommendedPriceController.text),
                  performanceLevel: pickedPerformanceLevel,
                );
                await hddController.postData(hdd);
                // Очищает список полей
                _fieldProvider.deleteFields();
              },
              child: Text('${_locale?.submit}'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/storage/ssd_cells_type_controller.dart';
import 'package:buildpc/controller/storage/ssd_controller.dart';
import 'package:buildpc/controller/storage/storage_form_factor_controller.dart';
import 'package:buildpc/controller/storage/storage_interface_controller.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/storage/ssd_cells_type_repository.dart';
import 'package:buildpc/repository/storage/ssd_repository.dart';
import 'package:buildpc/repository/storage/storage_form_factor_repository.dart';
import 'package:buildpc/repository/storage/storage_interface_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class SsdCreatePage extends StatelessWidget {
  const SsdCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Ssd';
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
    final ssdCellsTypeController =
        SsdCellsTypeController(SsdCellsTypeRepository());
    final storageInterfaceController =
        StorageInterfaceController(StorageInterfaceRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final storageFormFactor = await storageFormFactorController.getList();
    final storageInterface = await storageInterfaceController.getList();
    final ssdCellsType = await ssdCellsTypeController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('StorageFormFactors', storageFormFactor);
      _modelList.addNewKV('StorageInterfaces', storageInterface);
      _modelList.addNewKV('SsdCellsTypes', ssdCellsType);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final ssdController = SsdController(SsdRepository());

  final nameController = TextEditingController(text: '');
  final storageSizeController = TextEditingController(text: '');
  final bufferSizeController = TextEditingController(text: '');
  final readingSpeedController = TextEditingController(text: '');
  final writingSpeedController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  StorageFormFactor? pickedFormFactor;
  StorageInterface? pickedStorageInterface;
  SsdCellsType? pickedSsdCellsType;
  PerformanceLevel? pickedPerformanceLevel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelList = widget.modelList;
    modelList?.remove('id');
    final modelLength = modelList?.length ?? 0;
    final _fieldProvider = context.read<FieldController>();
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel('Ssd', context);

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
                        decoration: const InputDecoration(hintText: 'name'),
                        controller: nameController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.storageSize}',
                        ),
                        controller: storageSizeController,
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
                      DropdownButton(
                        hint: Text('${_locale?.cellsType}'),
                        items:
                            _modelList.modelMap['SsdCellsTypes']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedSsdCellsType = newVal as SsdCellsType?;
                          });
                        },
                        value: pickedSsdCellsType,
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
                  final ssd = Ssd(
                    id: null,
                    name: nameController.text,
                    producer: pickedProducer,
                    storageSize: int.parse(storageSizeController.text),
                    formFactor: pickedFormFactor,
                    storageInterface: pickedStorageInterface,
                    bufferSize: int.parse(bufferSizeController.text),
                    readingSpeed: int.parse(readingSpeedController.text),
                    writingSpeed: int.parse(writingSpeedController.text),
                    cellsType: pickedSsdCellsType,
                    description: descriptionController.text,
                    recommendedPrice: int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await ssdController.postData(ssd);
                  // Очищает список полей
                  _fieldProvider.deleteFields();
                },
                child: Text('${_locale?.submit}', style: TextStyle(fontSize: 20),),
              ),
            ),
            const SizedBox(
              height: 50,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}

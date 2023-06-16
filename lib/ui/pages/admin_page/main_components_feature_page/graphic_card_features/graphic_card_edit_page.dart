import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/gpu/gpu_connector_controller.dart';
import 'package:buildpc/controller/gpu/gpu_interface_type_controller.dart';
import 'package:buildpc/controller/gpu/gpu_memory_type_controller.dart';
import 'package:buildpc/controller/gpu/gpu_technologies_controller.dart';
import 'package:buildpc/controller/gpu/graphic_card_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/gpu/gpu_connector_repository.dart';
import 'package:buildpc/repository/gpu/gpu_interface_type_repository.dart';
import 'package:buildpc/repository/gpu/gpu_memory_type_repository.dart';
import 'package:buildpc/repository/gpu/gpu_technologies_repository.dart';
import 'package:buildpc/repository/gpu/graphic_card_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GraphicCardEditPage extends StatelessWidget {
  const GraphicCardEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'GraphicCard';
    final _userController = context.read<UserController>();
    final _modelController = context.read<ModelController>();
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
          userController: _userController,
          modelName: modelName,
          fieldNames: text,
          model: _modelController.currentModel,
        ),
      ),
    );
  }
}

class _MainView extends StatefulWidget {
  final UserController userController;
  final String? modelName;
  final List<String>? fieldNames;
  final Model? model;

  const _MainView({
    Key? key,
    required this.fieldNames,
    required this.model,
    required this.modelName,
    required this.userController,
  }) : super(key: key);

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
    final fields = _modelList.currentModel?.parsedModels();
    idController.text = '${fields?[0]}';
    nameController.text = '${fields?[2]}';
    super.initState();
  }

  Future<void> getModels() async {
    final producerController = ProducersController(ProducersRepository());
    final gpuMemoryTypeController =
        GpuMemoryTypeController(GpuMemoryTypeRepository());
    final gpuConnectorController =
        GpuConnectorController(GpuConnectorRepository());
    final gpuInterfaceTypeController =
        GpuInterfaceTypeController(GpuInterfaceTypeRepository());
    final gpuTechnologiesController =
        GpuTechnologiesController(GpuTechnologiesRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final vendors = producers;
    final gpuMemoryType = await gpuMemoryTypeController.getList();
    final gpuConnector = await gpuConnectorController.getList();
    final gpuInterfaceType = await gpuInterfaceTypeController.getList();
    final gpuTechnologies = await gpuTechnologiesController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('Vendors', vendors);
      _modelList.addNewKV('GpuMemoryTypes', gpuMemoryType);
      _modelList.addNewKV('GpuConnectors', gpuConnector);
      _modelList.addNewKV('GpuInterfaceTypes', gpuInterfaceType);
      _modelList.addNewKV('GpuTechnologies', gpuTechnologies);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final graphicCardController = GraphicCardController(GraphicCardRepository());
  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final vendorController = TextEditingController(text: '');
  final memorySlotsController = TextEditingController(text: '');
  final yearController = TextEditingController(text: '');
  final technicalProcessController = TextEditingController(text: '');
  final gpuFrequencyController = TextEditingController(text: '');
  final memoryAmountController = TextEditingController(text: '');
  final memoryFrequencyController = TextEditingController(text: '');
  final busController = TextEditingController(text: '');
  final tdpController = TextEditingController(text: '');
  final lengthController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  Producers? pickedVendor;
  GPUMemoryType? pickedGpuMemoryType;
  GPUInterfaceType? pickedGpuInterfaceType;
  GPUTechnologies? pickedGpuTechnologies;
  PerformanceLevel? pickedPerformanceLevel;

  GPUConnector? pickedGpuConnectors1;
  GPUConnector? pickedGpuConnectors2;
  GPUConnector? pickedGpuConnectors3;
  GPUConnector? pickedGpuConnectors4;

  @override
  Widget build(BuildContext context) {
    final modelLength = widget.fieldNames?.length ?? 0;

    final screenSize = MediaQuery.of(context).size;
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final _fieldProvider = context.read<FieldController>();
    //final mod = context.read<ModelController>();
    //final List<String> modelFields = widget.fieldNames ?? [];

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              width: screenSize.width * 0.5,
              height: 100,
              child: Text(
                '${_locale?.edit} ${widget.modelName}',
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
                    modelList: widget.fieldNames,
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
                        decoration:
                            InputDecoration(hintText: '${_locale?.name}'),
                        controller: nameController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.vendor}'),
                        items: _modelList.modelMap['Vendors']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedVendor = newVal as Producers?;
                          });
                        },
                        value: pickedVendor,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.year}'),
                        controller: yearController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.technicalProcess}',
                        ),
                        controller: technicalProcessController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.gpuFrequency}',
                        ),
                        controller: gpuFrequencyController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.memorySize}'),
                        controller: memoryAmountController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.gpuMemoryType}'),
                        items:
                            _modelList.modelMap['GpuMemoryTypes']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedGpuMemoryType = newVal as GPUMemoryType?;
                          });
                        },
                        value: pickedGpuMemoryType,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.memoryFrequency}',
                        ),
                        controller: memoryFrequencyController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.bus}'),
                        controller: busController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.tdp}'),
                        controller: tdpController,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.gpuConnector}'),
                            items: _modelList.modelMap['GpuConnectors']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedGpuConnectors1 = newVal as GPUConnector?;
                              });
                            },
                            value: pickedGpuConnectors1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.gpuConnector}'),
                            items: _modelList.modelMap['GpuConnectors']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedGpuConnectors2 = newVal as GPUConnector?;
                              });
                            },
                            value: pickedGpuConnectors2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.gpuConnector}'),
                            items: _modelList.modelMap['GpuConnectors']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedGpuConnectors3 = newVal as GPUConnector?;
                              });
                            },
                            value: pickedGpuConnectors3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.gpuConnector}'),
                            items: _modelList.modelMap['GpuConnectors']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedGpuConnectors4 = newVal as GPUConnector?;
                              });
                            },
                            value: pickedGpuConnectors4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.interfaceType}'),
                        items: _modelList.modelMap['GpuInterfaceTypes']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedGpuInterfaceType =
                                newVal as GPUInterfaceType?;
                          });
                        },
                        value: pickedGpuInterfaceType,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.length}'),
                        controller: lengthController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.description}',
                        ),
                        controller: descriptionController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.gpuTechnologies}'),
                        items:
                            _modelList.modelMap['GpuTechnologies']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedGpuTechnologies = newVal as GPUTechnologies?;
                          });
                        },
                        value: pickedGpuTechnologies,
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
            const SizedBox(
              height: 30,
              width: 100,
            ),
            Center(
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
                  final List<GPUConnector?> gpuCon = [];
                  if (pickedGpuConnectors1 != null) {
                    gpuCon.add(pickedGpuConnectors1);
                  }
                  if (pickedGpuConnectors2 != null) {
                    gpuCon.add(pickedGpuConnectors2);
                  }
                  if (pickedGpuConnectors3 != null) {
                    gpuCon.add(pickedGpuConnectors3);
                  }
                  if (pickedGpuConnectors4 != null) {
                    gpuCon.add(pickedGpuConnectors4);
                  }

                  final graphicCard = GraphicCard(
                    id: int.parse(idController.text),
                    producer: pickedProducer,
                    name: nameController.text,
                    vendor: pickedVendor,
                    year: int.parse(yearController.text),
                    technicalProcess:
                    int.parse(technicalProcessController.text),
                    gpuFrequency: int.parse(gpuFrequencyController.text),
                    memoryAmount: int.parse(memoryAmountController.text),
                    memoryType: pickedGpuMemoryType,
                    memoryFrequency:
                    int.parse(memoryFrequencyController.text),
                    bus: int.parse(busController.text),
                    tdp: int.parse(tdpController.text),
                    connector: gpuCon,
                    interfaceType: pickedGpuInterfaceType,
                    length: int.parse(lengthController.text),
                    description: descriptionController.text,
                    gpuTechnologies: pickedGpuTechnologies,
                    recommendedPrice:
                    int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await graphicCardController.updateData(graphicCard);

                  print('${graphicCard.parsedModels().toString()}');
                  // if (ModelUtil.modelMapping.containsKey(widget.modelName)) {
                  //   final constructor =
                  //       ModelUtil.modelMapping[widget.modelName];
                  //   final instance =
                  //       constructor!(_fieldProvider.fields) as Processor;
                  //   await processorController.updateData(instance);
                  //   mod.refresh();
                  // }
                  _fieldProvider.deleteFields();
                },
                child: Text('${_locale?.submit}'),
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

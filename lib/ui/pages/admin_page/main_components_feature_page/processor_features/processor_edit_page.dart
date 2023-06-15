import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/cpu/cpu_generation_controller.dart';
import 'package:buildpc/controller/cpu/cpu_pcie_version_controller.dart';
import 'package:buildpc/controller/cpu/cpu_technologies_controller.dart';
import 'package:buildpc/controller/cpu/processor_controller.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_socket_controller.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';
import 'package:buildpc/repository/cpu/cpu_technologies_repository.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProcessorEditPage extends StatelessWidget {
  const ProcessorEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Processor';
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
    super.initState();
  }

  Future<void> getModels() async {
    final producerController = ProducersController(ProducersRepository());
    final socketController =
        MotherboardSocketController(MotherboardSocketRepository());
    final cpuGenerationController =
        CpuGenerationController(CpuGenerationRepository());
    final pcieVersionController =
        CpuPcieVersionController(CpuPcieVersionRepository());
    final cpuTechnologiesController =
        CpuTechnologiesController(CpuTechnologiesRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final sockets = await socketController.getList();
    final cpuGenerations = await cpuGenerationController.getList();
    final pcieVersions = await pcieVersionController.getList();
    final cpuTechnologies = await cpuTechnologiesController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('MotherboardSockets', sockets);
      _modelList.addNewKV('CpuGenerations', cpuGenerations);
      _modelList.addNewKV('PcieVersions', pcieVersions);
      _modelList.addNewKV('CpuTechnologies', cpuTechnologies);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final processorController = ProcessorController(ProcessorRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final yearOfReleaseController = TextEditingController(text: '');
  final countOfCoresController = TextEditingController(text: '');
  final countOfThreadsController = TextEditingController(text: '');
  final baseFrequencyController = TextEditingController(text: '');
  final turboFrequencyController = TextEditingController(text: '');
  final l3CacheController = TextEditingController(text: '');
  final technicalProcessController = TextEditingController(text: '');
  final tdpController = TextEditingController(text: '');
  final maxTemperatureController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  final embeddedGraphicController = [true, false];
  bool? pickedEmbeddedGraphics;

  CPUTechnologies? pickedCpuTechnologies1;
  CPUTechnologies? pickedCpuTechnologies2;
  CPUTechnologies? pickedCpuTechnologies3;
  CPUTechnologies? pickedCpuTechnologies4;

  List<CPUTechnologies?> cpuTech = [];

  Producers? pickedProducer;
  MotherboardSocket? pickedMotherboardSocket;
  CPUGeneration? pickedCpuGeneration;
  CPUPCIeVersion? pickedCpuPcieVersion;
  PerformanceLevel? pickedPerformanceLevel;

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
                'Edit ${widget.modelName}',
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
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.name}'),
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
                        hint: Text('${_locale?.motherboardSocket}'),
                        items: _modelList.modelMap['MotherboardSockets']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedMotherboardSocket =
                                newVal as MotherboardSocket?;
                          });
                        },
                        value: pickedMotherboardSocket,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.year}'),
                        controller: yearOfReleaseController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.countOfCores}',
                        ),
                        controller: countOfCoresController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.countOfThreads}',
                        ),
                        controller: countOfThreadsController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.baseFrequency}',
                        ),
                        controller: baseFrequencyController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.turboBoostFrequency}',
                        ),
                        controller: turboFrequencyController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.l3Cache}',
                        ),
                        controller: l3CacheController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.cpuGeneration}'),
                        items:
                            _modelList.modelMap['CpuGenerations']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCpuGeneration = newVal as CPUGeneration?;
                          });
                        },
                        value: pickedCpuGeneration,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.technicalProcess}',
                        ),
                        controller: technicalProcessController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.tdp}',
                        ),
                        controller: tdpController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.maxTemperature}',
                        ),
                        controller: maxTemperatureController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.embeddedGraphics}'),
                        items: embeddedGraphicController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedEmbeddedGraphics = newVal;
                          });
                        },
                        value: pickedEmbeddedGraphics,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.pcieVersion}'),
                        items: _modelList.modelMap['PcieVersions']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCpuPcieVersion = newVal as CPUPCIeVersion?;
                          });
                        },
                        value: pickedCpuPcieVersion,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.cpuTechnologies}'),
                            items: _modelList.modelMap['CpuTechnologies']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuTechnologies1 =
                                    newVal as CPUTechnologies?;
                              });
                            },
                            value: pickedCpuTechnologies1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuTechnologies}'),
                            items: _modelList.modelMap['CpuTechnologies']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuTechnologies2 =
                                    newVal as CPUTechnologies?;
                              });
                            },
                            value: pickedCpuTechnologies2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuTechnologies}'),
                            items: _modelList.modelMap['CpuTechnologies']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuTechnologies3 =
                                    newVal as CPUTechnologies?;
                              });
                            },
                            value: pickedCpuTechnologies3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuTechnologies}'),
                            items: _modelList.modelMap['CpuTechnologies']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuTechnologies4 =
                                    newVal as CPUTechnologies?;
                              });
                            },
                            value: pickedCpuTechnologies4,
                          ),
                        ],
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
                  final List<CPUTechnologies?> cpuTech = [
                    pickedCpuTechnologies1,
                    pickedCpuTechnologies2,
                    pickedCpuTechnologies3,
                    pickedCpuTechnologies4
                  ];
                  final processor = Processor(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    producer: pickedProducer,
                    socket: pickedMotherboardSocket,
                    yearOfRelease: int.parse(yearOfReleaseController.text),
                    countOfCores: int.parse(countOfCoresController.text),
                    countOfThreads: int.parse(countOfThreadsController.text),
                    baseFrequency: double.parse(baseFrequencyController.text),
                    turboFrequency: double.parse(turboFrequencyController.text),
                    l3Cache: int.parse(l3CacheController.text),
                    cpuGeneration: pickedCpuGeneration,
                    technicalProcess:
                        int.parse(technicalProcessController.text),
                    tdp: int.parse(tdpController.text),
                    maxTemperature: int.parse(maxTemperatureController.text),
                    embeddedGraphic: pickedEmbeddedGraphics,
                    pcieVersion: pickedCpuPcieVersion,
                    cpuTechnologies: cpuTech,
                    description: descriptionController.text,
                    recommendedPrice:
                        int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );

                  await processorController.updateData(processor);
                  print('${processor.parsedModels().toString()}');
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

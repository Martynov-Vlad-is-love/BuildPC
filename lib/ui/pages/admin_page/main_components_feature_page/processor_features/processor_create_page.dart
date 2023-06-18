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
import 'package:buildpc/controller/model_controller_factory.dart';
import 'package:buildpc/controller/motherboard/motherboard_socket_controller.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';
import 'package:buildpc/repository/cpu/cpu_technologies_repository.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/dynamic_text_form_fields.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class ProcessorCreatePage extends StatelessWidget {
  const ProcessorCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Processor';
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
  final embeddedGraphicController = [true, false];
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  MotherboardSocket? pickedMotherboardSocket;
  CPUGeneration? pickedCpuGeneration;
  CPUPCIeVersion? pickedCpuPcieVersion;

  CPUTechnologies? pickedCpuTechnologies1;
  CPUTechnologies? pickedCpuTechnologies2;
  CPUTechnologies? pickedCpuTechnologies3;
  CPUTechnologies? pickedCpuTechnologies4;

  PerformanceLevel? pickedPerformanceLevel;
  bool? pickedEmbeddedGraphics;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelList = widget.modelList;
    modelList?.remove('id');
    final modelLength = modelList?.length ?? 0;
    final List<String> modelFields = widget.modelList ?? [];
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel('Processor', context);
    final _fieldProvider = context.read<FieldController>();
    final model =
        ModelControllerFactory.createController('${widget.modelName}');

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
                  final List<CPUTechnologies?> cpuTech = [
                    pickedCpuTechnologies1,
                    pickedCpuTechnologies2,
                    pickedCpuTechnologies3,
                    pickedCpuTechnologies4
                  ];
                  final processor = Processor(
                    id: null,
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
                    technicalProcess: int.parse(technicalProcessController.text),
                    tdp: int.parse(tdpController.text),
                    maxTemperature: int.parse(maxTemperatureController.text),
                    embeddedGraphic: pickedEmbeddedGraphics,
                    pcieVersion: pickedCpuPcieVersion,
                    cpuTechnologies: cpuTech,
                    description: descriptionController.text,
                    recommendedPrice: int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await model.postData(processor);

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

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<String> model = ['Field 1', 'Field 2', 'Field 3'];

  List<String> formFieldValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic TextFormFields Example')),
      body: Column(
        children: [
          DynamicTextFormFields(
            model: model,
            onChanged: (values) {
              setState(() {
                formFieldValues = values;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Пример использования значений из формы
              print('Form Field Values: $formFieldValues');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class TextBarListView extends StatelessWidget {
  final String modelName;
  final ValueChanged<String> onChanged;

  const TextBarListView({
    Key? key,
    required this.modelName,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models = Component();
    final Map<String, List<String>> modelMap = models.getComponents(context);
    final List<String>? model = modelMap[modelName];
    final textController = TextEditingController();

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        return Row(
          children: [
            Text('${model?[index]}'),
            TextFormField(
              decoration: InputDecoration(hintText: model?[index]),
              controller: textController,
              onChanged: onChanged,
            ),
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model?.length ?? 0,
    );
  }
}

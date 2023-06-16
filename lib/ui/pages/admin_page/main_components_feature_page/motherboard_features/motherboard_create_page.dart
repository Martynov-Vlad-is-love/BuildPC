import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/cpu/cpu_generation_controller.dart';
import 'package:buildpc/controller/cpu/cpu_pcie_version_controller.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/form_factor_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_chipset_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_network_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_socket_controller.dart';
import 'package:buildpc/controller/ram/ram_memory_type_controller.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';
import 'package:buildpc/repository/general/form_factor_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_chipset_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_network_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';
import 'package:buildpc/repository/ram/ram_memory_type_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/dynamic_text_form_fields.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class MotherboardCreatePage extends StatelessWidget {
  const MotherboardCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Motherboard';
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
    final motherboardChipsetController =
        MotherboardChipsetController(MotherboardChipsetRepository());
    final formFactorController = FormFactorController(FormFactorRepository());
    final ramMemoryTypeController =
    RamMemoryTypeController(RamMemoryTypeRepository());
    final motherboardNetworkController =
        MotherboardNetworkController(MotherboardNetworkRepository());
    final pcieVersionController =
        CpuPcieVersionController(CpuPcieVersionRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final sockets = await socketController.getList();
    final cpuGenerations = await cpuGenerationController.getList();
    final pcieVersions = await pcieVersionController.getList();
    final motherboardChipsets = await motherboardChipsetController.getList();
    final formFactors = await formFactorController.getList();
    final ramMemoryTypes = await ramMemoryTypeController.getList();
    final motherboardNetworks = await motherboardNetworkController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('MotherboardSockets', sockets);
      _modelList.addNewKV('CpuGenerations', cpuGenerations);
      _modelList.addNewKV('PcieVersions', pcieVersions);
      _modelList.addNewKV('MotherboardChipsets', motherboardChipsets);
      _modelList.addNewKV('FormFactors', formFactors);
      _modelList.addNewKV('RamMemoryTypes', ramMemoryTypes);
      _modelList.addNewKV('MotherboardNetworks', motherboardNetworks);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final motherboardController = MotherboardController(MotherboardRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final maxTdpOfProcessorsController = TextEditingController(text: '');
  final memorySlotsController = TextEditingController(text: '');
  final supportedMemoryFrequencyController = TextEditingController(text: '');
  final maxAmountOfRamController = TextEditingController(text: '');
  final bluetoothController = [true, false];
  final wifiController = [true, false];
  final pciExpressX16Controller = TextEditingController(text: '');
  final pciExpressX4Controller = TextEditingController(text: '');
  final pciExpressX1Controller = TextEditingController(text: '');
  final sata3Controller = TextEditingController(text: '');
  final m2Controller = TextEditingController(text: '');
  final dSubController = [true, false];
  final dviController = TextEditingController(text: '');
  final hdmiController = TextEditingController(text: '');
  final displayPortController = TextEditingController(text: '');
  final usb_3_0Controller = TextEditingController(text: '');
  final usb_2_0Controller = TextEditingController(text: '');
  final usbTypeCController = TextEditingController(text: '');
  final digitalAudioJackController = [true, false];
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  MotherboardSocket? pickedMotherboardSocket;
  CPUPCIeVersion? pickedCpuPcieVersion;
  MotherboardChipset? pickedMotherboardChipset;
  FormFactor? pickedFormFactor;
  RamMemoryType? pickedRamMemoryType;
  MotherboardNetwork? pickedMotherboardNetwork;

  CPUGeneration? pickedCpuGenerations1;
  CPUGeneration? pickedCpuGenerations2;
  CPUGeneration? pickedCpuGenerations3;
  CPUGeneration? pickedCpuGenerations4;

  PerformanceLevel? pickedPerformanceLevel;

  bool? pickedBluetooth;
  bool? pickedWifi;
  bool? pickedDigitalAudioJack;
  bool? pickeddSub;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelLength = widget.modelList?.length ?? 0;
    final List<String> modelFields = widget.modelList ?? [];
    final _userController = context.read<UserController>();
    final _modelController = context.read<ModelController>();
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.cpuGeneration}'),
                            items: _modelList.modelMap['CpuGenerations']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuGenerations1 =
                                    newVal as CPUGeneration?;
                              });
                            },
                            value: pickedCpuGenerations1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuGeneration}'),
                            items: _modelList.modelMap['CpuGenerations']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuGenerations2 =
                                    newVal as CPUGeneration?;
                              });
                            },
                            value: pickedCpuGenerations2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuGeneration}'),
                            items: _modelList.modelMap['CpuGenerations']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuGenerations3 =
                                    newVal as CPUGeneration?;
                              });
                            },
                            value: pickedCpuGenerations3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.cpuGeneration}'),
                            items: _modelList.modelMap['CpuGenerations']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCpuGenerations4 =
                                    newVal as CPUGeneration?;
                              });
                            },
                            value: pickedCpuGenerations4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.motherboardChipset}'),
                        items: _modelList.modelMap['MotherboardChipsets']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedMotherboardChipset =
                                newVal as MotherboardChipset?;
                          });
                        },
                        value: pickedMotherboardChipset,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.formFactor}'),
                        items: _modelList.modelMap['FormFactors']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedFormFactor = newVal as FormFactor?;
                          });
                        },
                        value: pickedFormFactor,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.maxTDP}'),
                        controller: maxTdpOfProcessorsController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.memorySlots}',
                        ),
                        controller: memorySlotsController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.supportedMemoryFrequency}',
                        ),
                        controller: supportedMemoryFrequencyController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.maxAmountOfRam}',
                        ),
                        controller: maxAmountOfRamController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.ramMemoryType}'),
                        items: _modelList.modelMap['RamMemoryTypes']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedRamMemoryType =
                                newVal as RamMemoryType?;
                          });
                        },
                        value: pickedRamMemoryType,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.network}'),
                        items: _modelList.modelMap['MotherboardNetworks']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedMotherboardNetwork =
                                newVal as MotherboardNetwork?;
                          });
                        },
                        value: pickedMotherboardNetwork,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.bluetooth}'),
                        items: bluetoothController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedBluetooth = newVal;
                          });
                        },
                        value: pickedBluetooth,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.wifi}'),
                        items: wifiController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedWifi = newVal;
                          });
                        },
                        value: pickedWifi,
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
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.pciExpressX16}',
                        ),
                        controller: pciExpressX16Controller,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.pciExpressX4}',
                        ),
                        controller: pciExpressX4Controller,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.pciExpressX1}',
                        ),
                        controller: pciExpressX1Controller,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.sata3}',
                        ),
                        controller: sata3Controller,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'M.2',
                        ),
                        controller: m2Controller,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.dSub}'),
                        items: dSubController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickeddSub = newVal;
                          });
                        },
                        value: pickeddSub,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.dvi}',
                        ),
                        controller: dviController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.hdmi}',
                        ),
                        controller: hdmiController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.displayPort}',
                        ),
                        controller: displayPortController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.usb_3_0}',
                        ),
                        controller: usb_3_0Controller,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.usb_2_0}',
                        ),
                        controller: usb_2_0Controller,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.usbTypeC}',
                        ),
                        controller: usbTypeCController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.digitalAudioJack}'),
                        items: digitalAudioJackController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedDigitalAudioJack = newVal;
                          });
                        },
                        value: pickedDigitalAudioJack,
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
                final List<CPUGeneration?> cpuGen = [];
                if (pickedCpuGenerations1 != null) {
                  cpuGen.add(pickedCpuGenerations1);
                }
                if (pickedCpuGenerations2 != null) {
                  cpuGen.add(pickedCpuGenerations2);
                }
                if (pickedCpuGenerations3 != null) {
                  cpuGen.add(pickedCpuGenerations3);
                }
                if (pickedCpuGenerations4 != null) {
                  cpuGen.add(pickedCpuGenerations4);
                }

                final motherboard = Motherboard(
                  id: null,
                  name: nameController.text,
                  motherboardProducer: pickedProducer,
                  socket: pickedMotherboardSocket,
                  cpuGenerations: cpuGen,
                  chipset: pickedMotherboardChipset,
                  formFactor: pickedFormFactor,
                  maxTdpOfProcessors:
                      int.parse(maxTdpOfProcessorsController.text),
                  memorySlots: int.parse(memorySlotsController.text),
                  supportedMemoryFrequency:
                      int.parse(supportedMemoryFrequencyController.text),
                  maxAmountOfRam: int.parse(maxAmountOfRamController.text),
                  ramMemoryType: pickedRamMemoryType,
                  network: pickedMotherboardNetwork,
                  bluetooth: pickedBluetooth,
                  wifi: pickedWifi,
                  pcieVersion: pickedCpuPcieVersion,
                  pciExpressX16: int.parse(pciExpressX16Controller.text),
                  pciExpressX4: int.parse(pciExpressX4Controller.text),
                  pciExpressX1: int.parse(pciExpressX1Controller.text),
                  sata3: int.parse(sata3Controller.text),
                  m2: int.parse(m2Controller.text),
                  dsub: pickeddSub,
                  dvi: int.parse(dviController.text),
                  hdmi: int.parse(hdmiController.text),
                  displayPort: int.parse(displayPortController.text),
                  usb_3_0: int.parse(usb_3_0Controller.text),
                  usb_2_0: int.parse(usb_2_0Controller.text),
                  usbTypeC: int.parse(dviController.text),
                  digitalAudioJack: pickedDigitalAudioJack,
                  description: descriptionController.text,
                  recommendedPrice: int.parse(recommendedPriceController.text),
                  performanceLevel: pickedPerformanceLevel,
                );
                await motherboardController.postData(motherboard);
                // Очищает список полей
                _fieldProvider.deleteFields();
              },
              child: Text('Submit'),
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

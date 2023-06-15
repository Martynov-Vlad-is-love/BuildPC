import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/form_factor_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/power/power_supply_controller.dart';
import 'package:buildpc/controller/power/power_supply_protection_functions_controller.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/general/form_factor_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/power/power_supply_protection_functions_repository.dart';
import 'package:buildpc/repository/power/power_supply_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class PowerSupplyCreatePage extends StatelessWidget {
  const PowerSupplyCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'PowerSupply';
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
    final formFactorController = FormFactorController(FormFactorRepository());
    final powerSupplyProtectionFunctionsController =
        PowerSupplyProtectionFunctionsController(
            PowerSupplyProtectionFunctionsRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final formFactor = await formFactorController.getList();
    final powerSupplyProtectionFunctions =
        await powerSupplyProtectionFunctionsController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('FormFactors', formFactor);
      _modelList.addNewKV(
        'PowerSupplyProtectionFunctions',
        powerSupplyProtectionFunctions,
      );
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final powerSupplyController = PowerSupplyController(PowerSupplyRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final powerController = TextEditingController(text: '');
  final pfcModuleController = [true, false];
  final modularConnectionController = [true, false];
  final cpu_4pinController = TextEditingController(text: '');
  final cpu_4plus4pinController = TextEditingController(text: '');
  final cpu_8pinController = TextEditingController(text: '');
  final pcie_6plus2pinController = TextEditingController(text: '');
  final pcie_8pinController = TextEditingController(text: '');
  final pcie_5_16pinController = TextEditingController(text: '');
  final sataController = TextEditingController(text: '');
  final countOf_12VLinesController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  FormFactor? pickedFormFactor;
  PerformanceLevel? pickedPerformanceLevel;

  PowerSupplyProtectionFunctions? pickedPowerSupplyProtectionFunctions1;
  PowerSupplyProtectionFunctions? pickedPowerSupplyProtectionFunctions2;
  PowerSupplyProtectionFunctions? pickedPowerSupplyProtectionFunctions3;
  PowerSupplyProtectionFunctions? pickedPowerSupplyProtectionFunctions4;

  bool? pickedPfcModule;
  bool? pickedModularConnection;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final modelLength = widget.modelList?.length ?? 0;
    // final List<String> modelFields = widget.modelList ?? [];
    // final _userController = context.read<UserController>();
    // final _modelController = context.read<ModelController>();
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
                        decoration:
                            InputDecoration(hintText: '${_locale?.power}'),
                        controller: powerController,
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
                      DropdownButton(
                        hint: Text('${_locale?.pfcModule}'),
                        items: pfcModuleController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedPfcModule = newVal;
                          });
                        },
                        value: pickedPfcModule,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.modularConnection}'),
                        items: modularConnectionController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedModularConnection = newVal;
                          });
                        },
                        value: pickedModularConnection,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.protectionFunctions}'),
                            items: _modelList
                                .modelMap['PowerSupplyProtectionFunctions']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedPowerSupplyProtectionFunctions1 =
                                    newVal as PowerSupplyProtectionFunctions?;
                              });
                            },
                            value: pickedPowerSupplyProtectionFunctions1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.protectionFunctions}'),
                            items: _modelList
                                .modelMap['PowerSupplyProtectionFunctions']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedPowerSupplyProtectionFunctions2 =
                                    newVal as PowerSupplyProtectionFunctions?;
                              });
                            },
                            value: pickedPowerSupplyProtectionFunctions2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.protectionFunctions}'),
                            items: _modelList.modelMap['MotherboardSockets']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedPowerSupplyProtectionFunctions3 =
                                    newVal as PowerSupplyProtectionFunctions?;
                              });
                            },
                            value: pickedPowerSupplyProtectionFunctions3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.protectionFunctions}'),
                            items: _modelList.modelMap['MotherboardSockets']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedPowerSupplyProtectionFunctions3 =
                                    newVal as PowerSupplyProtectionFunctions?;
                              });
                            },
                            value: pickedPowerSupplyProtectionFunctions3,
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.cpu_4pin}'),
                        controller: cpu_4pinController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.cpu_4plus4pin}',
                        ),
                        controller: cpu_4plus4pinController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '${_locale?.pcie_6plus2pin}'),
                        controller: pcie_6plus2pinController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.pcie_8pin}',
                        ),
                        controller: pcie_8pinController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '${_locale?.pcie_5_16pin}'),
                        controller: pcie_5_16pinController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.sata}',
                        ),
                        controller: sataController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '${_locale?.countOf_12VLines}'),
                        controller: countOf_12VLinesController,
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
                final List<PowerSupplyProtectionFunctions?>
                    protectionFunctions = [];
                if (pickedPowerSupplyProtectionFunctions1 != null) {
                  protectionFunctions
                      .add(pickedPowerSupplyProtectionFunctions1);
                }
                if (pickedPowerSupplyProtectionFunctions2 != null) {
                  protectionFunctions
                      .add(pickedPowerSupplyProtectionFunctions2);
                }
                if (pickedPowerSupplyProtectionFunctions3 != null) {
                  protectionFunctions
                      .add(pickedPowerSupplyProtectionFunctions3);
                }
                if (pickedPowerSupplyProtectionFunctions4 != null) {
                  protectionFunctions
                      .add(pickedPowerSupplyProtectionFunctions4);
                }

                final powerSupply = PowerSupply(
                  id: int.parse(idController.text),
                  name: nameController.text,
                  producer: pickedProducer,
                  power: int.parse(powerController.text),
                  formFactor: pickedFormFactor,
                  pfcModule: pickedPfcModule,
                  modularConnection: pickedModularConnection,
                  protectionFunctions: protectionFunctions,
                  cpu_4pin: int.parse(cpu_4plus4pinController.text),
                  cpu_4plus4pin: int.tryParse(cpu_4plus4pinController.text),
                  cpu_8pin: int.tryParse(cpu_8pinController.text),
                  pcie_6plus2pin: int.tryParse(pcie_6plus2pinController.text),
                  pcie_8pin: int.tryParse(pcie_8pinController.text),
                  pcie_5_16pin: int.tryParse(pcie_5_16pinController.text),
                  sata: int.tryParse(sataController.text),
                  countOf_12VLines:
                      int.tryParse(countOf_12VLinesController.text),
                  description: descriptionController.text,
                  recommendedPrice: int.parse(recommendedPriceController.text),
                  performanceLevel: pickedPerformanceLevel,
                );
                await powerSupplyController.postData(powerSupply);

                print('Form Field Values: $result');
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

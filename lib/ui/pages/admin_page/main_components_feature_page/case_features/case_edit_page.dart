import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/case/case_controller.dart';
import 'package:buildpc/controller/case/case_design_features_controller.dart';
import 'package:buildpc/controller/case/case_power_supply_location_controller.dart';
import 'package:buildpc/controller/case/case_size_controller.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/form_factor_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/repository/case/case_design_features_repository.dart';
import 'package:buildpc/repository/case/case_power_supply_location_repository.dart';
import 'package:buildpc/repository/case/case_repository.dart';
import 'package:buildpc/repository/case/case_size_repository.dart';
import 'package:buildpc/repository/general/form_factor_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//ignore_for_file: avoid-late-keyword

class CaseEditPage extends StatelessWidget {
  const CaseEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Case';
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
    nameController.text = '${fields?[1]}';
    super.initState();
  }

  Future<void> getModels() async {
    final caseSizeController = CaseSizeController(CaseSizeRepository());
    final producerController = ProducersController(ProducersRepository());
    final formFactorController = FormFactorController(FormFactorRepository());
    final casePowerSupplyLocationController =
        CasePowerSupplyLocationController(CasePowerSupplyLocationRepository());

    final caseDesignFeaturesController =
        CaseDesignFeaturesController(CaseDesignFeaturesRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final caseSizes = await caseSizeController.getList();
    final formFactors = await formFactorController.getList();
    final casePowerSupplyLocation =
        await casePowerSupplyLocationController.getList();
    final caseDesignFeatures = await caseDesignFeaturesController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('CaseSizes', caseSizes);
      _modelList.addNewKV('FormFactors', formFactors);
      _modelList.addNewKV('CaseDesignFeatures', caseDesignFeatures);
      _modelList.addNewKV('CasePowerSupplyLocations', casePowerSupplyLocation);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final caseController = CaseController(CaseRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final fansIncludedController = [true, false];
  final usb_3_2Controller = TextEditingController(text: '');
  final usb_3_0Controller = TextEditingController(text: '');
  final usb_2_0Controller = TextEditingController(text: '');
  final maxLengthOfGraphicCardController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  CaseSize? pickedCaseSize;
  CasePowerSupplyLocation? pickedCasePowerSupplyLocation;
  PerformanceLevel? pickedPerformanceLevel;

  FormFactor? pickedFormFactor1;
  FormFactor? pickedFormFactor2;
  FormFactor? pickedFormFactor3;
  FormFactor? pickedFormFactor4;

  CaseDesignFeatures? pickedCaseDesignFeatures1;
  CaseDesignFeatures? pickedCaseDesignFeatures2;
  CaseDesignFeatures? pickedCaseDesignFeatures3;
  CaseDesignFeatures? pickedCaseDesignFeatures4;

  bool? pickedFansIncluded;

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
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'name'),
                        controller: nameController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.caseSize}'),
                        items: _modelList.modelMap['CaseSizes']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCaseSize = newVal as CaseSize?;
                          });
                        },
                        value: pickedCaseSize,
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
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.formFactor}'),
                            items:
                                _modelList.modelMap['FormFactors']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedFormFactor1 = newVal as FormFactor?;
                              });
                            },
                            value: pickedFormFactor1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.formFactor}'),
                            items:
                                _modelList.modelMap['FormFactors']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedFormFactor2 = newVal as FormFactor?;
                              });
                            },
                            value: pickedFormFactor2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.formFactor}'),
                            items:
                                _modelList.modelMap['FormFactors']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedFormFactor3 = newVal as FormFactor?;
                              });
                            },
                            value: pickedFormFactor3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.formFactor}'),
                            items:
                                _modelList.modelMap['FormFactors']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedFormFactor4 = newVal as FormFactor?;
                              });
                            },
                            value: pickedFormFactor4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.powerSupplyLocation}'),
                        items: _modelList.modelMap['CasePowerSupplyLocations']
                            ?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCasePowerSupplyLocation =
                                newVal as CasePowerSupplyLocation?;
                          });
                        },
                        value: pickedCasePowerSupplyLocation,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.fansIncluded}'),
                        items: fansIncludedController.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedFansIncluded = newVal;
                          });
                        },
                        value: pickedFansIncluded,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.usb_3_2}'),
                        controller: usb_3_2Controller,
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
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.caseDesignFeatures}'),
                            items: _modelList.modelMap['CaseDesignFeatures']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCaseDesignFeatures1 =
                                    newVal as CaseDesignFeatures?;
                              });
                            },
                            value: pickedCaseDesignFeatures1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.caseDesignFeatures}'),
                            items: _modelList.modelMap['CaseDesignFeatures']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCaseDesignFeatures2 =
                                    newVal as CaseDesignFeatures?;
                              });
                            },
                            value: pickedCaseDesignFeatures2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.caseDesignFeatures}'),
                            items: _modelList.modelMap['CaseDesignFeatures']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCaseDesignFeatures3 =
                                    newVal as CaseDesignFeatures?;
                              });
                            },
                            value: pickedCaseDesignFeatures3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.caseDesignFeatures}'),
                            items: _modelList.modelMap['CaseDesignFeatures']
                                ?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedCaseDesignFeatures4 =
                                    newVal as CaseDesignFeatures?;
                              });
                            },
                            value: pickedCaseDesignFeatures4,
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.maxLengthOfGraphicCard}',
                        ),
                        controller: maxLengthOfGraphicCardController,
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

                  final List<FormFactor?> formFactors = [];
                  if (pickedFormFactor1 != null) {
                    formFactors.add(pickedFormFactor1);
                  }
                  if (pickedFormFactor2 != null) {
                    formFactors.add(pickedFormFactor2);
                  }
                  if (pickedFormFactor3 != null) {
                    formFactors.add(pickedFormFactor3);
                  }
                  if (pickedFormFactor4 != null) {
                    formFactors.add(pickedFormFactor4);
                  }

                  final List<CaseDesignFeatures?> designFeatures = [];
                  if (pickedCaseDesignFeatures1 != null) {
                    designFeatures.add(pickedCaseDesignFeatures1);
                  }
                  if (pickedCaseDesignFeatures1 != null) {
                    designFeatures.add(pickedCaseDesignFeatures1);
                  }
                  if (pickedCaseDesignFeatures1 != null) {
                    designFeatures.add(pickedCaseDesignFeatures1);
                  }
                  if (pickedCaseDesignFeatures1 != null) {
                    designFeatures.add(pickedCaseDesignFeatures1);
                  }

                  final pcCase = Case(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    size: pickedCaseSize,
                    producer: pickedProducer,
                    formFactor: formFactors,
                    powerSupplyLocation: pickedCasePowerSupplyLocation,
                    fansIncluded: pickedFansIncluded,
                    usb_3_2: int.parse(usb_3_2Controller.text),
                    usb_3_0: int.parse(usb_3_0Controller.text),
                    usb_2_0: int.parse(usb_2_0Controller.text),
                    designFeatures: designFeatures,
                    maxLengthOfGraphicCard:
                    int.parse(maxLengthOfGraphicCardController.text),
                    description: descriptionController.text,
                    recommendedPrice: int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await caseController.updateData(pcCase);

                  print('Form Field Values: $result');
                  // Очищает список полей
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

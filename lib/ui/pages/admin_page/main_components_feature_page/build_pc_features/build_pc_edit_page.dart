import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/case/case_controller.dart';
import 'package:buildpc/controller/cooler/cooler_controller.dart';
import 'package:buildpc/controller/cpu/processor_controller.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/build_pc_controller.dart';
import 'package:buildpc/controller/general/rating_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/gpu/graphic_card_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_controller.dart';
import 'package:buildpc/controller/power/power_supply_controller.dart';
import 'package:buildpc/controller/ram/ram_controller.dart';
import 'package:buildpc/controller/storage/hdd_controller.dart';
import 'package:buildpc/controller/storage/ssd_controller.dart';
import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/repository/case/case_repository.dart';
import 'package:buildpc/repository/cooler/cooler_repository.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';
import 'package:buildpc/repository/general/build_pc_repository.dart';
import 'package:buildpc/repository/general/rating_repository.dart';
import 'package:buildpc/repository/general/user_repository.dart';
import 'package:buildpc/repository/gpu/graphic_card_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_repository.dart';
import 'package:buildpc/repository/power/power_supply_repository.dart';
import 'package:buildpc/repository/ram/ram_repository.dart';
import 'package:buildpc/repository/storage/hdd_repository.dart';
import 'package:buildpc/repository/storage/ssd_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BuildPcEditPage extends StatelessWidget {
  const BuildPcEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'BuildPC';
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
    nameOfBuildController.text = '${fields?[1]}';
    super.initState();
  }

  Future<void> getModels() async {
    final userController = UserController(UserRepository());
    final motherboardController =
        MotherboardController(MotherboardRepository());
    final processorController = ProcessorController(ProcessorRepository());
    final graphicCardController =
        GraphicCardController(GraphicCardRepository());
    final ramController = RamController(RamRepository());
    final powerSupplyController =
        PowerSupplyController(PowerSupplyRepository());
    final hddController = HddController(HddRepository());
    final ssdController = SsdController(SsdRepository());
    final caseController = CaseController(CaseRepository());
    final coolerController = CoolerController(CoolerRepository());
    final ratingIdController = RatingController(RatingRepository());

    final _modelList = context.read<ModelController>();

    final users = await userController.getList();
    final motherboards = await motherboardController.getList();
    final processors = await processorController.getList();
    final graphicCards = await graphicCardController.getList();
    final ram = await ramController.getList();
    final powerSupplies = await powerSupplyController.getList();
    final hdd = await hddController.getList();
    final ssd = await ssdController.getList();
    final pcCases = await caseController.getList();
    final coolers = await coolerController.getList();
    final rating = await ratingIdController.getList();

    setState(() {
      _modelList.addNewKV('Users', users);
      _modelList.addNewKV('Motherboards', motherboards);
      _modelList.addNewKV('Processors', processors);
      _modelList.addNewKV('GraphicCards', graphicCards);
      _modelList.addNewKV('Ram', ram);
      _modelList.addNewKV('PowerSupplies', powerSupplies);
      _modelList.addNewKV('Hdd', hdd);
      _modelList.addNewKV('Ssd', ssd);
      _modelList.addNewKV('PcCases', pcCases);
      _modelList.addNewKV('Coolers', coolers);
      _modelList.addNewKV('Rating', rating);
    });
  }

  List<String> result = [];
  final buildPcController = BuildPcController(BuildPcRepository());

  final idController = TextEditingController(text: '');
  final nameOfBuildController = TextEditingController(text: '');
  final countOfLikesController = TextEditingController(text: '');
  final totalPriceController = TextEditingController(text: '');

  User? pickedUser;
  Motherboard? pickedMotherboard;
  Processor? pickedProcessor;
  GraphicCard? pickedGraphicCard;
  PowerSupply? pickedPowerSupply;
  Case? pickedPcCase;
  Cooler? pickedCooler;
  Rating? pickedRating;

  Ram? pickedRam1;
  Ram? pickedRam2;
  Ram? pickedRam3;
  Ram? pickedRam4;

  Hdd? pickedHdd1;
  Hdd? pickedHdd2;
  Hdd? pickedHdd3;
  Hdd? pickedHdd4;

  Ssd? pickedSsd1;
  Ssd? pickedSsd2;
  Ssd? pickedSsd3;
  Ssd? pickedSsd4;

  @override
  Widget build(BuildContext context) {
    final modelLength = widget.fieldNames?.length ?? 0;
    final _modelController = context.read<ModelController>();

    final screenSize = MediaQuery.of(context).size;
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final _fieldProvider = context.read<FieldController>();
    //final mod = context.read<ModelController>();
    //final List<String> modelFields = widget.fieldNames ?? [];
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel('BuildPC', context);

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
                '${_locale?.edit} "$translate"',
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
                        controller: nameOfBuildController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.user}'),
                        items: _modelList.modelMap['Users']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedUser = newVal as User?;
                          });
                        },
                        value: pickedUser,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.motherboard}'),
                        items: _modelList.modelMap['Motherboards']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedMotherboard = newVal as Motherboard?;
                          });
                        },
                        value: pickedMotherboard,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.processor}'),
                        items: _modelList.modelMap['Processors']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedProcessor = newVal as Processor?;
                          });
                        },
                        value: pickedProcessor,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.graphicCard}'),
                        items: _modelList.modelMap['GraphicCards']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[2]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedGraphicCard = newVal as GraphicCard?;
                          });
                        },
                        value: pickedGraphicCard,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.ram}'),
                            items: _modelList.modelMap['Ram']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedRam1 = newVal as Ram?;
                              });
                            },
                            value: pickedRam1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ram}'),
                            items: _modelList.modelMap['Ram']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedRam2 = newVal as Ram?;
                              });
                            },
                            value: pickedRam2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ram}'),
                            items: _modelList.modelMap['Ram']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedRam3 = newVal as Ram?;
                              });
                            },
                            value: pickedRam3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ram}'),
                            items: _modelList.modelMap['Ram']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedRam4 = newVal as Ram?;
                              });
                            },
                            value: pickedRam4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.powerSupply}'),
                        items:
                        _modelList.modelMap['PowerSupplies']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedPowerSupply = newVal as PowerSupply?;
                          });
                        },
                        value: pickedPowerSupply,
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.hdd}'),
                            items: _modelList.modelMap['Hdd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedHdd1 = newVal as Hdd?;
                              });
                            },
                            value: pickedHdd1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.hdd}'),
                            items: _modelList.modelMap['Hdd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedHdd2 = newVal as Hdd?;
                              });
                            },
                            value: pickedHdd2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.hdd}'),
                            items: _modelList.modelMap['Hdd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedHdd3 = newVal as Hdd?;
                              });
                            },
                            value: pickedHdd3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.hdd}'),
                            items: _modelList.modelMap['Hdd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[1]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedHdd4 = newVal as Hdd?;
                              });
                            },
                            value: pickedHdd4,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text('${_locale?.ssd}'),
                            items: _modelList.modelMap['Ssd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[2]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedSsd1 = newVal as Ssd?;
                              });
                            },
                            value: pickedSsd1,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ssd}'),
                            items: _modelList.modelMap['Ssd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[2]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedSsd2 = newVal as Ssd?;
                              });
                            },
                            value: pickedSsd2,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ssd}'),
                            items: _modelList.modelMap['Ssd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[2]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedSsd3 = newVal as Ssd?;
                              });
                            },
                            value: pickedSsd3,
                          ),
                          DropdownButton(
                            hint: Text('${_locale?.ssd}'),
                            items: _modelList.modelMap['Ssd']?.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text('${item?.parsedModels()[2]}'),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                pickedSsd4 = newVal as Ssd?;
                              });
                            },
                            value: pickedSsd4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.pcCase}'),
                        items: _modelList.modelMap['PcCases']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedPcCase = newVal as Case?;
                          });
                        },
                        value: pickedPcCase,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.cooler}'),
                        items: _modelList.modelMap['Coolers']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCooler = newVal as Cooler?;
                          });
                        },
                        value: pickedCooler,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.countOfLikes}',
                        ),
                        controller: countOfLikesController,
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.ratingId}'),
                        items: _modelList.modelMap['Ratings']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedRating = newVal as Rating?;
                          });
                        },
                        value: pickedRating,
                      ),
                      // DropdownButton(
                      //   hint: Text('${_locale?.rating}'),
                      //   items:
                      //   _modelList.modelMap['Rating']?.map((item) {
                      //     return DropdownMenuItem(
                      //       value: item,
                      //       child: Text('${item?.parsedModels()[1]}'),
                      //     );
                      //   }).toList(),
                      //   onChanged: (newVal) {
                      //     setState(() {
                      //       pickedRating = newVal as SsdCellsType?;
                      //     });
                      //   },
                      //   value: pickedSsdCellsType,
                      // ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.totalPrice}',
                        ),
                        controller: totalPriceController,
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
              child: Container(
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
                    final List<Ram?> ram = [];
                    if (pickedRam1 != null) {
                      ram.add(pickedRam1);
                    }
                    if (pickedRam2 != null) {
                      ram.add(pickedRam2);
                    }
                    if (pickedRam3 != null) {
                      ram.add(pickedRam3);
                    }
                    if (pickedRam4 != null) {
                      ram.add(pickedRam4);
                    }

                    final List<Hdd?> hdd = [];
                    if (pickedHdd1 != null) {
                      hdd.add(pickedHdd1);
                    }
                    if (pickedHdd2 != null) {
                      hdd.add(pickedHdd2);
                    }
                    if (pickedHdd3 != null) {
                      hdd.add(pickedHdd3);
                    }
                    if (pickedHdd4 != null) {
                      hdd.add(pickedHdd4);
                    }

                    final List<Ssd?> ssd = [];
                    if (pickedSsd1 != null) {
                      ssd.add(pickedSsd1);
                    }
                    if (pickedSsd2 != null) {
                      ssd.add(pickedSsd2);
                    }
                    if (pickedSsd3 != null) {
                      ssd.add(pickedSsd3);
                    }
                    if (pickedSsd4 != null) {
                      ssd.add(pickedSsd4);
                    }

                    final buildPc = BuildPC(
                      id: int.parse(idController.text),
                      nameOfBuild: nameOfBuildController.text,
                      user: pickedUser,
                      motherboard: pickedMotherboard,
                      processor: pickedProcessor,
                      graphicCard: pickedGraphicCard,
                      ram: ram,
                      powerSupply: pickedPowerSupply,
                      hdd: hdd,
                      ssd: ssd,
                      pcCase: pickedPcCase,
                      cooler: pickedCooler,
                      countOfLikes: int.parse(countOfLikesController.text),
                      ratingId: null,
                      totalPrice: int.parse(totalPriceController.text),
                    );
                    await buildPcController.updateData(buildPc);
                    // Очищает список полей
                    _fieldProvider.deleteFields();
                  },
                  child: Text('${_locale?.submit}'),
                ),
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

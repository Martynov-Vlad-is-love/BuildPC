import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/cooler/cooler_controller.dart';
import 'package:buildpc/controller/cooler/cooler_material_controller.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/performance_level_controller.dart';
import 'package:buildpc/controller/general/producers_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/motherboard/motherboard_socket_controller.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/cooler/cooler_material_repository.dart';
import 'package:buildpc/repository/cooler/cooler_repository.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CoolerEditPage extends StatelessWidget {
  const CoolerEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'Cooler';
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
    final motherboardSocketController =
        MotherboardSocketController(MotherboardSocketRepository());
    final coolerMaterialController =
        CoolerMaterialController(CoolerMaterialRepository());
    final performanceLevelController =
        PerformanceLevelController(PerformanceLevelRepository());

    final _modelList = context.read<ModelController>();

    final producers = await producerController.getList();
    final motherboardSockets = await motherboardSocketController.getList();
    final coolerMaterial = await coolerMaterialController.getList();
    final performanceLevels = await performanceLevelController.getList();

    setState(() {
      _modelList.addNewKV('Producers', producers);
      _modelList.addNewKV('MotherboardSockets', motherboardSockets);
      _modelList.addNewKV('CoolerMaterials', coolerMaterial);
      _modelList.addNewKV('PerformanceLevels', performanceLevels);
    });
  }

  List<String> result = [];
  final coolerController = CoolerController(CoolerRepository());

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final maxTdpController = TextEditingController(text: '');
  final supportedSocketsController = TextEditingController(text: '');
  final thermalTubesController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final recommendedPriceController = TextEditingController(text: '');

  Producers? pickedProducer;
  CoolerMaterial? pickedCoolerMaterial;
  PerformanceLevel? pickedPerformanceLevel;

  MotherboardSocket? pickedMotherboardSocket1;
  MotherboardSocket? pickedMotherboardSocket2;
  MotherboardSocket? pickedMotherboardSocket3;
  MotherboardSocket? pickedMotherboardSocket4;

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
                      Row(
                        children: [
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
                                pickedMotherboardSocket1 =
                                    newVal as MotherboardSocket?;
                              });
                            },
                            value: pickedMotherboardSocket1,
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
                                pickedMotherboardSocket2 =
                                    newVal as MotherboardSocket?;
                              });
                            },
                            value: pickedMotherboardSocket2,
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
                                pickedMotherboardSocket3 =
                                    newVal as MotherboardSocket?;
                              });
                            },
                            value: pickedMotherboardSocket3,
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
                                pickedMotherboardSocket4 =
                                    newVal as MotherboardSocket?;
                              });
                            },
                            value: pickedMotherboardSocket4,
                          ),
                        ],
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.coolerMaterial}'),
                        items:
                            _modelList.modelMap['CoolerMaterials']?.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('${item?.parsedModels()[1]}'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedCoolerMaterial = newVal as CoolerMaterial?;
                          });
                        },
                        value: pickedCoolerMaterial,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.maxTDP}'),
                        controller: maxTdpController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '${_locale?.thermotubes}',
                        ),
                        controller: thermalTubesController,
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
                  final List<MotherboardSocket?> sockets = [];
                  if (pickedMotherboardSocket1 != null) {
                    sockets.add(pickedMotherboardSocket1);
                  }
                  if (pickedMotherboardSocket2 != null) {
                    sockets.add(pickedMotherboardSocket2);
                  }
                  if (pickedMotherboardSocket3 != null) {
                    sockets.add(pickedMotherboardSocket3);
                  }
                  if (pickedMotherboardSocket4 != null) {
                    sockets.add(pickedMotherboardSocket4);
                  }

                  final cooler = Cooler(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    producer: pickedProducer,
                    socket: sockets,
                    material: pickedCoolerMaterial,
                    maxTdp: int.parse(maxTdpController.text),
                    thermalTubes: int.tryParse(thermalTubesController.text),
                    description: descriptionController.text,
                    recommendedPrice:
                        int.parse(recommendedPriceController.text),
                    performanceLevel: pickedPerformanceLevel,
                  );
                  await coolerController.updateData(cooler);

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

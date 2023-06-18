import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/repository/general/user_repository.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const modelName = 'User';
    final _userController = context.read<UserController>();
    final _modelController = context.read<ModelController>();
    final component = Component();
    final text = component.getUsers(context);
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
  final userController = UserController(UserRepository());
  ModelController get _modelList => context.read<ModelController>();

  final idController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final userNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');

  ERole pickedRole = ERole.ROLE_USER;
  @override
  void initState() {

    final fields = _modelList.currentModel?.parsedModels();
    idController.text = '${fields?[0]}';
    nameController.text = '${fields?[1]}';
    userNameController.text = '${fields?[2]}';
    emailController.text = '${fields?[3]}';
    if(fields?[5] == 'ERole.ROLE_ADMIN'){
      pickedRole = ERole.ROLE_ADMIN;
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final modelLength = widget.fieldNames?.length ?? 0;

    final screenSize = MediaQuery.of(context).size;
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final _fieldProvider = context.read<FieldController>();
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel('Motherboard', context);

    return Container(
      height: screenSize.height,
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
                        validator: (String? value) {
                          return (value != null && int.tryParse(value) == null)
                              ? '${_locale?.intError}'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.name}'),
                        controller: nameController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.userName}'),
                        controller: userNameController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: '${_locale?.email}'),
                        controller: emailController,
                        validator: (String? value) {
                          return (value != null && !value.contains('@')) ? 'Do not use the @ char.' : null;
                        },
                      ),
                      DropdownButton(
                        hint: Text('${_locale?.role}'),
                        items: ERole.values.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text('$item'),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            pickedRole = newVal as ERole;
                          });
                        },
                        value: pickedRole,
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
                  final user = User(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    username: userNameController.text,
                    email: emailController.text,
                    role: pickedRole,
                  );
                  await userController.updateData(user);
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

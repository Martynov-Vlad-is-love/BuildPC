import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/field_controller.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/model_controller_factory.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model_utilis/model_util.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/dynamic_text_form_fields.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  final String? modelName;

  const EditPage({Key? key, this.modelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  List<String> result = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final modelLength = widget.fieldNames?.length ?? 0;
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final _fieldProvider = context.read<FieldController>();
    final mod = context.read<ModelController>();
    final List<String> modelFields = widget.fieldNames ?? [];
    final model =
        ModelControllerFactory.createController('${widget.modelName}');

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
                  flex: 1,
                  child: ModelListView(
                    modelList: widget.fieldNames,
                    itemCount: modelLength,
                  ),
                ),
                const CustomBorder(),
                Expanded(
                  flex: 1,
                  child: DynamicTextFormFields(
                    model: modelFields,
                    onChanged: (values) {
                      setState(() {
                        result = values;
                      });
                    },
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
                  _fieldProvider.fields = result;
                  if (ModelUtil.modelMapping.containsKey(widget.modelName)) {
                    final constructor =
                        ModelUtil.modelMapping[widget.modelName];
                    final instance =
                        constructor!(_fieldProvider.fields) as Model;
                    await model.updateData(instance);
                    mod.refresh();
                  }
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

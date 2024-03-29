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

//ignore_for_file: avoid-late-keyword

class CreateModelPage extends StatelessWidget {
  final String? modelName;

  const CreateModelPage({Key? key, required this.modelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  List<String> result = [];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;
    final List<String> modelFields = widget.modelList ?? [];
    final _userController = context.read<UserController>();
    final _modelController = context.read<ModelController>();
    final _fieldProvider = context.read<FieldController>();
    final model =
        ModelControllerFactory.createController('${widget.modelName}');
    final translatedModel = Translate();
    final translate =
    translatedModel.getTranslatedModel(widget.modelName, context);
    modelFields.remove('id');
    final modelLength = modelFields.length;

    return Container(
      height: screenSize.height,
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
                  flex: 1,
                  child: ModelListView(
                    modelList: widget.modelList,
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
            const SizedBox(height: 100),
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
                final List<String> arr = [];
                final id = _modelController.currentModel?.parsedModels().first;
                arr.add('$id');
                _fieldProvider.fields = result;
                for (final element in _fieldProvider.fields) {
                  if (element != '') {
                    arr.add(element);
                  }
                }

                if (ModelUtil.modelMapping.containsKey(widget.modelName)) {
                  final constructor = ModelUtil.modelMapping[widget.modelName];
                  final instance = constructor!(arr) as Model;
                  await model.postData(instance);
                }

                print('Form Field Values: ${result}');
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

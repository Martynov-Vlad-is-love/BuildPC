import 'package:buildpc/controller/model_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicTextFormFields extends StatefulWidget {
  final List<String> model;
  final ValueChanged<List<String>> onChanged;

  const DynamicTextFormFields({
    Key? key,
    required this.model,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DynamicTextFormFieldsState createState() => _DynamicTextFormFieldsState();
}

class _DynamicTextFormFieldsState extends State<DynamicTextFormFields> {
  //ignore: avoid-late-keyword
  late List<TextEditingController> textControllers;
  List<String> result = [];
  bool isSetInitValue = false;
  int fieldsCount = 0;
  @override
  void initState() {
    textControllers =
        List.generate(widget.model.length, (_) => TextEditingController());
    fieldsCount = widget.model.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _modelList = context.read<ModelController>();
    final data = _modelList.currentModel?.parsedModels();

    return Column(
      children: List.generate(widget.model.length, (index) {
        if(data?[index] != null && fieldsCount > 0){
          textControllers[index].text += '${data?[index+1]}';
          fieldsCount -= 1;
        }

        return TextFormField(
          decoration: InputDecoration(hintText: widget.model[index]),
          controller: textControllers[index],
          onChanged: (value) {
            final values =
            textControllers.map((controller) => controller.text).toList();
            widget.onChanged(values);
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    for (final controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

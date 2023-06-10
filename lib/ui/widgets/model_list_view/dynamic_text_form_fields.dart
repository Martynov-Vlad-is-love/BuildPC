import 'package:flutter/material.dart';

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

  @override
  void initState() {
    textControllers =
        List.generate(widget.model.length, (_) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.model.length, (index) {
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

import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<Model?> modelList;
  final String modelName;
  final Model? pickedModel;

  const CustomDropDownButton({
    Key? key,
    required this.pickedModel,
    required this.modelList,
    required this.modelName,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    final modelProvider = context.read<ModelController>();
    Model? model;

    return DropdownButton(
      hint: Text('Test'),
      items: widget.modelList.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text('${item?.parsedModels()[1].toString()}'),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          model = newVal;
        });
      },
      value: model,
    );
  }
}

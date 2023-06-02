import 'package:buildpc/constant.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/ui/widgets/border/custom_border.dart';
import 'package:buildpc/ui/widgets/model_list_view/data_model_list_view.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final String? modelName;
  final Model model;

  const EditPage({Key? key, this.modelName, required this.model})
      : super(key: key);

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
          modelName: text,
          model: model,
        ),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final List<String>? modelName;
  final Model model;

  const _MainView({Key? key, required this.modelName, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final modelLength = modelName?.length ?? 0;

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              width: screenSize.width * 0.5,
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBorder(),
                Expanded(
                  flex: 1,
                  child: ModelListView(
                    modelList: modelName,
                    itemCount: modelLength,
                  ),
                ),
                const CustomBorder(),
                Expanded(
                  flex: 1,
                  child: DataModelListView(
                    model: model,
                    itemCount: modelLength,
                  ),
                ),
                const CustomBorder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

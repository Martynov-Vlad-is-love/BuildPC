import 'package:buildpc/model/model.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';

class ModelListPage extends StatelessWidget {
  final List<Model>? modelList;

  const ModelListPage({Key? key, required this.modelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: SafeArea(
        child: _MainView(modelList: modelList,),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final List<Model?>? modelList;

  const _MainView({Key? key, this.modelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: screenSize.width * 0.8,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.5,
                  child: ModelListViewBar(modelList: modelList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

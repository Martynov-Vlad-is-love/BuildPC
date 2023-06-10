import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/model_controller_factory.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/model_list_view/model_list_view_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ModelListPage extends StatelessWidget {
  final String? modelName;

  const ModelListPage({Key? key, required this.modelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: SafeArea(
        child: _MainView(
          modelName: modelName,
        ),
      ),
    );
  }
}

class _MainView extends StatefulWidget {
  final String? modelName;

  const _MainView({Key? key, required this.modelName}) : super(key: key);

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
    if (widget.modelName != null) {
      final name = '${widget.modelName}';
      final model = ModelControllerFactory.createController(name);
      final _modelList = context.read<ModelController>();

      final list = await model.getList() as List<Model?>;

      setState(() {
        _modelList.setAllModel(list);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final modelName = '${widget.modelName}';

    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: screenSize.width,
              height: 100,
              child: Text(
                'List of $modelName',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.5,
                    child: ModelListViewBar(
                      modelList: _modelList.model,
                      modelName: modelName,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              width: 50,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.red,
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(
                    AppRouteConstants.createModelPage,
                    pathParameters: {'modelName': '${widget.modelName}'},
                  );
                },
                style: TextButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                child: const Text(
                  'Add a component',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

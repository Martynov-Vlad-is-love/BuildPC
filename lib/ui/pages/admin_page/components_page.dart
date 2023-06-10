import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_name_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ComponentsPage extends StatefulWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  State<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _modelController = context.read<ModelController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: SafeArea(
        child: _MainView(modelController: _modelController),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final ModelController modelController;

  const _MainView({Key? key, required this.modelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRouteModelNameButton(
                  label: '${_locale?.graphicCard}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'GraphicCard',
                  //modelName: 'GraphicCard',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.pcCase}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Case',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.cooler}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Cooler',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRouteModelNameButton(
                  label: '${_locale?.processor}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Processor',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.motherboard}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Motherboard',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.powerSupply}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'PowerSupply',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRouteModelNameButton(
                  label: '${_locale?.ram}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Ram',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.hdd}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Hdd',
                ),
                CustomRouteModelNameButton(
                  label: '${_locale?.ssd}',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'Ssd',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

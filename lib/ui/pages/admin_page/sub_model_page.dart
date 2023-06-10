import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_button.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_name_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';

class SubModelPage extends StatelessWidget {
  const SubModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: const SafeArea(
        child: _MainView(),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRouteModelNameButton(
                  label: 'Users',
                  destination: AppRouteConstants.modelListPageRouteName,
                  modelName: 'User',
                  //modelName: 'GraphicCard',
                ),
                CustomRouteButton(
                  label: 'Registration',
                  destination: AppRouteConstants.registrationRouteName,
                  //modelName: 'GraphicCard',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
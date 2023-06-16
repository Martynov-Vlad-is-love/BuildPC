import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_button.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_name_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

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
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRouteModelNameButton(
                  label: '${_locale?.user}',
                  destination: AppRouteConstants.mainModelListPageRouteName,
                  modelName: 'User',
                ),
                CustomRouteButton(
                  label: '${_locale?.registration}',
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

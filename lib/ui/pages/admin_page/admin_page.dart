import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

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

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRouteButton(
                  label: '${_locale?.components}',
                  destination: AppRouteConstants.componentsPageRouteName,
                ),
                CustomRouteButton(
                  label: '${_locale?.users}',
                  destination: AppRouteConstants.usersRouteName,
                ),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomRouteButton(
                  label: '${_locale?.pcBuilds}',
                  destination: AppRouteConstants.componentsPageRouteName,
                ),
                CustomRouteButton(
                  label: '${_locale?.general}',
                  destination: AppRouteConstants.generalModelPage,
                ),
              ],)
            
          ],
        ),
      ),
    );
  }
}

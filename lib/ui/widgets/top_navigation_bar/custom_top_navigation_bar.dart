import 'package:buildpc/constant.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/language_picker/language_picker_item.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTopNavigationBar extends StatelessWidget {
  const CustomTopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    const isLog = false;
    String profileLabel = '${_locale?.profileLabel}';
    Icon profileWidget = const Icon(Icons.door_front_door_outlined);
    String destination = AppRouteConstants.loginRouteName;
    if (isLog == true) {
      profileLabel = '${_locale?.profile}';
      profileWidget = const Icon(Icons.person);
      destination = AppRouteConstants.mainRouteName;
    }

    return SafeArea(
      child: TopNavigationBar(
        label: 'BuildPC',
        height: kTopNavigationBarHeight,
        color: Colors.green[600],
        borderRadius: kTopNavigationBarBorderRadius,
        children: [
          TopNavigationBarItem(
            icon: const Icon(Icons.place),
            label: Text('${_locale?.homePage}'),
            destination: AppRouteConstants.mainRouteName,
          ),
          TopNavigationBarItem(
            icon: const Icon(Icons.computer),
            label: Text('${_locale?.myPC}'),
            destination: AppRouteConstants.mainRouteName,
          ),
          TopNavigationBarItem(
            icon: profileWidget,
            label: Text(profileLabel),
            destination: destination,
          ),
          const LanguagePickerItem(),
        ],
      ),
    );
  }
}

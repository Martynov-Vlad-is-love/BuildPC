import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/language_picker/language_picker_item.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CustomTopNavigationBar extends StatelessWidget {
  const CustomTopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final user = Provider.of<UserController>(context, listen: false);
    final isLog = user.user != null;
    String profileLabel = '${_locale?.profileLabel}';
    Icon profileWidget = const Icon(Icons.door_front_door_outlined);
    if (isLog == true) {
      profileLabel = '${_locale?.logOut}';
      profileWidget = const Icon(Icons.output);
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
            label: Text(
              '${_locale?.homePage}',
              style: const TextStyle(color: Colors.white),
            ),
            destination: AppRouteConstants.adminRouteName,
          ),
          TopNavigationBarItem(
            icon: profileWidget,
            label:
                Text(profileLabel, style: const TextStyle(color: Colors.white)),
            destination: AppRouteConstants.loginRouteName,
          ),
          const LanguagePickerItem(),
        ],
      ),
    );
  }
}

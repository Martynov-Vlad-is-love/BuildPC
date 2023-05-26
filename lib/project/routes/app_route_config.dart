import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/pages/admin_page/admin_page.dart';
import 'package:buildpc/ui/pages/admin_page/components_page.dart';
import 'package:buildpc/ui/pages/admin_page/edit_page.dart';
import 'package:buildpc/ui/pages/login_page/login_page.dart';
import 'package:buildpc/ui/pages/main_page/main_page.dart';
import 'package:buildpc/ui/pages/registration_page/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static GoRouter returnRouter(bool isAuth) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRouteConstants.mainRouteName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: MainPage()),
        ),
        GoRoute(
          path: '/login',
          name: AppRouteConstants.loginRouteName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginPage()),
        ),
        GoRoute(
          path: '/registration',
          name: AppRouteConstants.registrationRouteName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: RegistrationScreen()),
        ),
        GoRoute(
          path: '/edit:model',
          name: AppRouteConstants.editRouteName,
          pageBuilder: (context, state) => MaterialPage(
            child: EditPage(
              model: state.pathParameters['model'],
            ),
          ),
        ),
        GoRoute(
          path: '/components_page',
          name: AppRouteConstants.componentsPageRouteName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ComponentsPage()),
        ),
        GoRoute(
          path: '/admin',
          name: AppRouteConstants.adminRouteName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: AdminPage()),
        ),
      ],
      redirect: (context, state) {
        return !isAuth &&
                state.location
                    .startsWith('/${AppRouteConstants.adminRouteName}')
            ? context.namedLocation(AppRouteConstants.loginRouteName)
            : null;
      },
    );

    return router;
  }
}

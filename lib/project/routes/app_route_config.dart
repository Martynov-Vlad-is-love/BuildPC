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
  final bool isAuth;
  final GoRouter goRouter; // This instance will be store route state
  static GoRouter get _router => returnRouter(isAuth: true);
  AppRouteConfig({required this.isAuth}) : goRouter = _router;


  static GoRouter returnRouter({required bool isAuth}) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRouteConstants.mainRouteName,
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'login',
              name: AppRouteConstants.loginRouteName,
              builder: (context, state) =>
                  const LoginPage(),
            ),
            GoRoute(
              path: 'registration',
              name: AppRouteConstants.registrationRouteName,
              builder: (context, state) =>
                  const RegistrationScreen(),
            ),
            GoRoute(
              path: 'edit:model',
              name: AppRouteConstants.editRouteName,
              builder: (context, state) => EditPage(
                model: state.pathParameters['model'],
              ),
            ),
            GoRoute(
              path: 'components_page',
              name: AppRouteConstants.componentsPageRouteName,
              builder: (context, state) =>
                  const ComponentsPage(),
            ),
            GoRoute(
              path: 'admin',
              name: AppRouteConstants.adminRouteName,
              builder: (context, state) =>
                  const AdminPage(),
            ),
          ],
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

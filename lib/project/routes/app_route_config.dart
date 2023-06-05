import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/pages/admin_page/admin_page.dart';
import 'package:buildpc/ui/pages/admin_page/components_page.dart';
import 'package:buildpc/ui/pages/admin_page/edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/model_list_page.dart';
import 'package:buildpc/ui/pages/admin_page/users_page.dart';
import 'package:buildpc/ui/pages/login_page/login_page.dart';
import 'package:buildpc/ui/pages/registration_page/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//ignore_for_file: cast_nullable_to_non_nullable

class AppRouteConfig {
  final GoRouter goRouter; // This instance will be store route state
  static GoRouter get _router => returnRouter();

  AppRouteConfig() : goRouter = _router;

  static GoRouter returnRouter() {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRouteConstants.mainRouteName,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'login',
              name: AppRouteConstants.loginRouteName,
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: 'registration',
              name: AppRouteConstants.registrationRouteName,
              builder: (context, state) => const RegistrationScreen(),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
            GoRoute(
              path: 'edit:modelName',
              name: AppRouteConstants.editRouteName,
              builder: (context, state) => EditPage(
                modelName: state.pathParameters['modelName'],
                model: state.extra as Model,
              ),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
            GoRoute(
              path: 'components_list_page',
              name: AppRouteConstants.componentsListPageRouteName,
              builder: (context, state) => ModelListPage(
                modelList: state.extra as List<Model>,
              ),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
            GoRoute(
              path: 'components_page',
              name: AppRouteConstants.componentsPageRouteName,
              builder: (context, state) => const ComponentsPage(),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
            GoRoute(
              path: 'admin',
              name: AppRouteConstants.adminRouteName,
              builder: (context, state) => const AdminPage(),
              redirect: (context, state) {
                final user =
                    Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
            GoRoute(
              path: 'users',
              name: AppRouteConstants.usersRouteName,
              builder: (context, state) => const UsersPage(),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            ),
          ],
        ),
      ],
    );

    return router;
  }
}

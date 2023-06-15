import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/pages/admin_page/admin_page.dart';
import 'package:buildpc/ui/pages/admin_page/components_page.dart';
import 'package:buildpc/ui/pages/admin_page/create_model_page.dart';
import 'package:buildpc/ui/pages/admin_page/edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/general_models_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/build_pc_features/build_pc_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/build_pc_features/build_pc_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/case_features/case_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/case_features/case_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/cooler_features/cooler_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/cooler_features/cooler_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/graphic_card_features/graphic_card_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/graphic_card_features/graphic_card_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/hdd_features/hdd_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/hdd_features/hdd_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/main_model_list_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/motherboard_features/motherboard_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/motherboard_features/motherboard_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/power_supply_features/power_supply_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/power_supply_features/power_supply_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/processor_features/processor_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/processor_features/processor_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/ram_features/ram_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/ram_features/ram_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/ssd_features/ssd_create_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/ssd_features/ssd_edit_page.dart';
import 'package:buildpc/ui/pages/admin_page/main_components_feature_page/user_features/user_edit_page.dart';
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
              path: 'model_list_page:modelName',
              name: AppRouteConstants.modelListPageRouteName,
              builder: (context, state) => ModelListPage(
                modelName: state.pathParameters['modelName'],
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
              redirect: (context, state) async {
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
            GoRoute(
              path: 'create:modelName',
              name: AppRouteConstants.createModelPage,
              builder: (context, state) => CreateModelPage(
                modelName: state.pathParameters['modelName'],
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
              path: 'general_model_page',
              name: AppRouteConstants.generalModelPage,
              builder: (context, state) => const GeneralModelsPage(),
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
              path: 'main_model_list_page:modelName',
              name: AppRouteConstants.mainModelListPageRouteName,
              builder: (context, state) => MainModelListPage(
                modelName: state.pathParameters['modelName'],
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
              path: 'edit/processor',
              name: AppRouteConstants.editProcessorRouteName,
              builder: (context, state) => const ProcessorEditPage(),
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
              path: 'create/processor',
              name: AppRouteConstants.createProcessorRouteName,
              builder: (context, state) => const ProcessorCreatePage(),
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
              path: 'create/motherboard',
              name: AppRouteConstants.createMotherboardRouteName,
              builder: (context, state) => const MotherboardCreatePage(),
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
              path: 'edit/motherboard',
              name: AppRouteConstants.editMotherboardRouteName,
              builder: (context, state) => const MotherboardEditPage(),
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
              path: 'create/graphic_card',
              name: AppRouteConstants.createGraphicCardRouteName,
              builder: (context, state) => const GraphicCardCreatePage(),
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
              path: 'edit/graphic_card',
              name: AppRouteConstants.editGraphicCardRouteName,
              builder: (context, state) => const GraphicCardEditPage(),
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
              path: 'create/cooler',
              name: AppRouteConstants.createCoolerRouteName,
              builder: (context, state) => const CoolerCreatePage(),
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
              path: 'edit/cooler',
              name: AppRouteConstants.editCoolerRouteName,
              builder: (context, state) => const CoolerEditPage(),
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
              path: 'create/case',
              name: AppRouteConstants.createCaseRouteName,
              builder: (context, state) => const CaseCreatePage(),
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
              path: 'edit/case',
              name: AppRouteConstants.editCaseRouteName,
              builder: (context, state) => const CaseEditPage(),
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
              path: 'create/power_supply',
              name: AppRouteConstants.createPowerSupplyRouteName,
              builder: (context, state) => const PowerSupplyCreatePage(),
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
              path: 'edit/power_supply',
              name: AppRouteConstants.editPowerSupplyRouteName,
              builder: (context, state) => const PowerSupplyEditPage(),
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
              path: 'create/ram',
              name: AppRouteConstants.createRamRouteName,
              builder: (context, state) => const RamCreatePage(),
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
              path: 'edit/ram',
              name: AppRouteConstants.editRamRouteName,
              builder: (context, state) => const RamEditPage(),
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
              path: 'create/hdd',
              name: AppRouteConstants.createHddRouteName,
              builder: (context, state) => const HddCreatePage(),
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
              path: 'edit/hdd',
              name: AppRouteConstants.editHddRouteName,
              builder: (context, state) => const HddEditPage(),
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
              path: 'create/ssd',
              name: AppRouteConstants.createSsdRouteName,
              builder: (context, state) => const SsdCreatePage(),
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
              path: 'edit/ssd',
              name: AppRouteConstants.editSsdRouteName,
              builder: (context, state) => const SsdEditPage(),
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
              path: 'create/build_pc',
              name: AppRouteConstants.createBuildPcRouteName,
              builder: (context, state) => const BuildPcCreatePage(),
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
              path: 'edit/build_pc',
              name: AppRouteConstants.editBuildPcRouteName,
              builder: (context, state) => const BuildPcEditPage(),
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
              path: 'edit/user',
              name: AppRouteConstants.editUserRouteName,
              builder: (context, state) => const UserEditPage(),
              redirect: (context, state) {
                final user =
                Provider.of<UserController>(context, listen: false);
                if (user.user == null) {
                  return '/${AppRouteConstants.loginRouteName}';
                }

                return null;
              },
            )
          ],
        ),
      ],
    );

    return router;
  }
}

import 'package:buildpc/project/routes/app_route_config.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = AppRouteConfig(isAuth: true);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: config.goRouter.routeInformationParser,
      routeInformationProvider: config.goRouter.routeInformationProvider,
      routerDelegate: config.goRouter.routerDelegate,
    );
  }
}

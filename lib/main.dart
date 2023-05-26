import 'package:buildpc/project/routes/app_route_config.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser:
          AppRouteConfig.returnRouter(true).routeInformationParser,
      routerDelegate: AppRouteConfig.returnRouter(true).routerDelegate,
    );
  }
}

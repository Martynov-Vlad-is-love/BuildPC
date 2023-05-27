import 'package:buildpc/l10n/l10n.dart';
import 'package:buildpc/project/routes/app_route_config.dart';
import 'package:buildpc/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _config = AppRouteConfig(isAuth: true);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider())
      ],
      builder: (context, child){
        final provider = Provider.of<LocaleProvider>(context);

         return MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          locale: provider.locale,
          debugShowCheckedModeBanner: false,
          routeInformationParser: _config.goRouter.routeInformationParser,
          routeInformationProvider: _config.goRouter.routeInformationProvider,
          routerDelegate: _config.goRouter.routerDelegate,
        );
      },

    );
  }
}

import 'package:buildpc/constant.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CheckCreateModelName extends StatelessWidget {
  final String modelName;
  final bool generalMode;

  const CheckCreateModelName(
      {Key? key, required this.modelName, required this.generalMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!checkNotCreatableModels.contains(modelName)) {
      final AppLocalizations? _locale = AppLocalizations.of(context);

      return Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurpleAccent,
              Colors.red,
            ],
          ),
        ),
        child: TextButton(
          onPressed: () {
            if(!generalMode){
              GoRouter.of(context).pushNamed(
                AppRouteConstants.getCreateRouteByName[modelName]!,
              );
            }
            else{
              GoRouter.of(context).pushNamed(
                AppRouteConstants.createModelPage,
                pathParameters: {'modelName': modelName},
              );
            }

          },
          style: TextButton.styleFrom(
            fixedSize: const Size(150, 50),
          ),
          child: Text(
            '${_locale?.addComponent}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    return const SizedBox(height: 200);
  }
}

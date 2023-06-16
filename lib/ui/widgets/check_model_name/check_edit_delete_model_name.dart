import 'package:buildpc/constant.dart';
import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/model_controller_factory.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckEditDeleteModelName extends StatelessWidget {
  final String modelName;
  final Model? currentItem;

  const CheckEditDeleteModelName(
      {Key? key, required this.modelName, this.currentItem,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!checkNotCreatableModels.contains(modelName)) {
      final AppLocalizations? _locale = AppLocalizations.of(context);
      final modelProvider = context.read<ModelController>();
      final modelController =
          ModelControllerFactory.createController(modelName);

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              modelProvider.setCurrentModel(currentItem);
              GoRouter.of(context).pushNamed(
                AppRouteConstants.editRouteName,
                pathParameters: {'modelName': modelName},
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 20,
              constraints: const BoxConstraints(minWidth: 50, maxWidth: 100),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black,
              ),
              child: Text(
                '${_locale?.edit}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await modelController.delete(
                int.parse('${currentItem?.parsedModels().first}'),
              );
                modelProvider.refresh();
            },
            child: Container(
              alignment: Alignment.center,
              height: 20,
              constraints: const BoxConstraints(minWidth: 50, maxWidth: 100),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black,
              ),
              child: Text(
                '${_locale?.delete}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      );
    }

    return const SizedBox(height: 1);
  }
}

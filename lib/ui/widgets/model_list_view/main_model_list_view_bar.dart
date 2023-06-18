import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/controller/model_controller_factory.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainModelListViewBar extends StatelessWidget {
  final String modelName;
  final List<Model?>? modelList;

  const MainModelListViewBar({
    Key? key,
    required this.modelName,
    required this.modelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelProvider = context.read<ModelController>();
    final modelController = ModelControllerFactory.createController(modelName);
    final AppLocalizations? _locale = AppLocalizations.of(context);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        MaterialColor _curColor = Colors.blue;
        if (index.isOdd) {
          _curColor = Colors.yellow;
        }
        final currentItem = modelList?[index];
        final item = currentItem?.parsedModels();
        final concatenate = StringBuffer();

        item?.forEach((item) {
          if (item.contains('[]') || item.contains('null')) {

            item = '${_locale?.empty}';
          }
          concatenate.write('$item| ');
        });


        return Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _curColor,
              ),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Id: $concatenate',
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          modelProvider.setCurrentModel(currentItem);
                          GoRouter.of(context).pushNamed(
                            AppRouteConstants.getEditRouteByName[modelName]!,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          constraints:
                          const BoxConstraints(minWidth: 50, maxWidth: 100),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.black,
                          ),
                          child: Text(
                            '${_locale?.edit}',
                            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
                          height: 30,
                          constraints:
                          const BoxConstraints(minWidth: 50, maxWidth: 100),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.black,
                          ),
                          child: Text(
                            '${_locale?.delete}',
                            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: modelList?.length,
    );
  }
}

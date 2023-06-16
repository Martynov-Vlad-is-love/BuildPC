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

        item?.forEach((String? item) {
          if(item == '[]' || item == 'null'){
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Id: $concatenate',
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          height: 20,
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
                            style: const TextStyle(color: Colors.white),
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

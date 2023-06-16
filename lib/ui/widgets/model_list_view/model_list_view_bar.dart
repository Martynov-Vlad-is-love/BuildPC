import 'package:buildpc/model/model.dart';
import 'package:buildpc/ui/widgets/check_model_name/check_edit_delete_model_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModelListViewBar extends StatelessWidget {
  final String modelName;
  final List<Model?>? modelList;

  const ModelListViewBar({
    Key? key,
    required this.modelName,
    required this.modelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          if (item == '[]' || item == 'null') {
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
                  const SizedBox(
                    height: 5,
                  ),
                  CheckEditDeleteModelName(
                    modelName: modelName,
                    currentItem: currentItem,
                  ),
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

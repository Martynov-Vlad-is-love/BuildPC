import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final modelController = context.read<ModelController>();

    return ListView.builder(
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
          concatenate.write('$item| ');
        });

        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _curColor,
              ),
              height: 60,
              child: Row(
                children: [
                  Text(
                    'Id: $concatenate',
                  ),
                  TextButton(
                    onPressed: () {
                      modelController.setCurrentModel(currentItem);
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.editRouteName,
                        pathParameters: {'modelName': modelName},
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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

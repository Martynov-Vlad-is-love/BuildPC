import 'package:buildpc/constant.dart';
import 'package:flutter/material.dart';

class TextBarListView extends StatelessWidget {
  final String modelName;
  final TextEditingController textController;

  const TextBarListView({Key? key,
    required this.textController,
    required this.modelName,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models = Component();
    final modelMap = models.getComponents(context);
    final model = modelMap[modelName];

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const Divider(),

      itemBuilder: (_, index) {
        return Row(
          children: [
            Text('${model?[index]}'),
            TextFormField(
              decoration: InputDecoration(hintText: model?[index]),
              controller: textController,
            ),
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model?.length ?? 0,
    );
  }
}

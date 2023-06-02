import 'package:buildpc/model/model.dart';
import 'package:flutter/material.dart';

class DataModelListView extends StatelessWidget {
  final Model? model;
  final int itemCount;

  const DataModelListView({
    Key? key,
    required this.model,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String>? modelList = model?.parsedModels();

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        return Row(
          children: [
            Text(
              '${modelList?[index]}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
    );
  }
}

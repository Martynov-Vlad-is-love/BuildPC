import 'package:flutter/material.dart';

class MainModelListView extends StatelessWidget {
  final List<String>? modelList;
  final int itemCount;

  const MainModelListView({
    Key? key,
    required this.modelList,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  final IconData icon;
  final String label;

  const TextBar({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    const kTextBarHeight = 50.0;

    return Container(
      height: kTextBarHeight,
      width: 500,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}

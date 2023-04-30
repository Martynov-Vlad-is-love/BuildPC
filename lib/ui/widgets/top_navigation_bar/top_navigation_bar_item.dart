import 'package:flutter/material.dart';

class TopNavigationBarItem extends StatelessWidget {
  final Icon icon;
  final Text label;
  final String destination;

  const TopNavigationBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: const ButtonStyle(
          iconSize: MaterialStatePropertyAll<double>(27.0),
          elevation: MaterialStatePropertyAll<double>(0.0),
          minimumSize: MaterialStatePropertyAll<Size>(Size(0, 45)),
          maximumSize: MaterialStatePropertyAll<Size>(Size(153, 70)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(destination, arguments: context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon, label],
        ),
      ),
    );
  }
}

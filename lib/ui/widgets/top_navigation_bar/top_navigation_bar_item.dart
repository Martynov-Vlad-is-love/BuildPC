import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          maximumSize: MaterialStatePropertyAll<Size>(Size(135, 70)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
        onPressed: () {
          GoRouter.of(context).pushNamed(destination);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon, label],
        ),
      ),
    );
  }
}

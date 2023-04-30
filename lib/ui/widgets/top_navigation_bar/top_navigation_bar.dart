import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final Color? color;
  final double borderRadius;
  final String label;

  const TopNavigationBar({
    Key? key,
    this.color,
    this.height = 5,
    this.borderRadius = 25,
    required this.children,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: children,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

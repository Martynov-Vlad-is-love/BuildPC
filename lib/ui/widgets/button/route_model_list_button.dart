import 'package:buildpc/model/model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteModelListButton extends StatelessWidget {
  final String label;
  final String destination;
  final List<Model> modelList;

  const RouteModelListButton({
    Key? key,
    required this.label,
    required this.destination,
    required this.modelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.red,
          ],
        ),
      ),
      margin: const EdgeInsets.fromLTRB(25, 30, 30, 25),
      child: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(destination,
               extra: modelList,);
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(350, 350),
          ),
          child: Text(
            //LocaleKeys.courses.tr(),
            label,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

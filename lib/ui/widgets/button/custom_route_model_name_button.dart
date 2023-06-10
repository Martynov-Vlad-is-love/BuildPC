import 'package:buildpc/controller/model_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomRouteModelNameButton extends StatelessWidget {
  final String label;
  final String destination;
  final String modelName;

  const CustomRouteModelNameButton({
    Key? key,
    required this.label,
    required this.destination,
    required this.modelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelList = context.read<ModelController>();

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
            modelList.model.clear();
            GoRouter.of(context).pushNamed(destination,
                pathParameters: {'modelName': modelName},);
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(350, 350),
          ),
          child: Text(
            //LocaleKeys.courses.tr(),
            label,
            textAlign: TextAlign.center,
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

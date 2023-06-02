import 'dart:js_util';

import 'package:buildpc/model/model.dart';
import 'package:flutter/material.dart';

import '../../../model/cooler/cooler.dart';

class ModelListViewBar extends StatelessWidget {
  final List<Model?>? modelList;

  //final int itemCount;

  const ModelListViewBar({
    Key? key,
    required this.modelList,
    //required this.modelList,
    //required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Model? model;
        if(item != null){
          if(instanceof(model, item[index])){

          }
        }


        item?.forEach((item){
          concatenate.write('$item| ');
        });


        return Container(
          height: 40,
          color: _curColor,
          child: Row(
            children: [
              Text(
                'Id: $concatenate',
              )
            ],
          ),
        );
      },
      itemCount: modelList?.length,
    );
  }
}

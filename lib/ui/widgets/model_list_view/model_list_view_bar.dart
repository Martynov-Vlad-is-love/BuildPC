import 'dart:js_util';

import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:flutter/material.dart';

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
        if(currentItem != null){
          if(currentItem is Cooler){
            concatenate.write('Cooler');
          }
          else if(currentItem is Ram){
            concatenate.write('Ram');
          }
        }


        item?.forEach((item){
          concatenate.write('$item| ');
        });


        return Center(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: _curColor),
            height: 60,
            child: Row(
              children: [
                Text(
                  'Id: $concatenate',
                )
              ],
            ),
          ),
        );
      },
      itemCount: modelList?.length,
    );
  }
}

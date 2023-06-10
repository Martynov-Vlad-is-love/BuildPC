import 'package:flutter/material.dart';

class FieldController extends ChangeNotifier{
  List<String> fields = [];
  void addFields(String field){
    fields.add(field);
    notifyListeners();
  }
  void deleteFields(){
    fields = [];
  }

}

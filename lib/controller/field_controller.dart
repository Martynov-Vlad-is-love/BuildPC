import 'package:flutter/material.dart';

class FieldController extends ChangeNotifier {
  List<String> fields = [];
  List<dynamic> modelFields = [];

  void addModelFields(dynamic field) {
    modelFields.add(field);
    notifyListeners();
  }

  void deleteModelFields() {
    modelFields = [];
    notifyListeners();
  }

  void addFields(String field) {
    fields.add(field);
    notifyListeners();
  }

  void deleteFields() {
    fields = [];
    notifyListeners();
  }
}

import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CaseDesignFeaturesRepository implements Repository<CaseDesignFeatures> {
  final path = 'Producer';
  final header = {
    'Content-type': 'application/json',
  };

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }

  @override
  Future<void> deleteData(int id) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    await http.delete(
      Uri.http(apiPath, '/api/admin/caseDesignFeatures/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CaseDesignFeatures>> getAllData() async {
    List<CaseDesignFeatures> caseDesignFeatures = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http
        .get(Uri.http(apiPath, '/api/all/caseDesignFeatures'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      caseDesignFeatures =
          data.map((e) => CaseDesignFeatures.fromJson(e)).toList();
    }

    return caseDesignFeatures;
  }

  @override
  Future<CaseDesignFeatures?> getDataById(int? id) async {
    CaseDesignFeatures? caseDesignFeatures;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/caseDesignFeatures/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      caseDesignFeatures = CaseDesignFeatures.fromJson(jsonData);
    }

    return caseDesignFeatures;
  }

  @override
  Future<void> postData(CaseDesignFeatures caseDesignFeatures) async {
    final token = await _getToken();

    try {
      final jsonData = caseDesignFeatures.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      print(caseDesignFeatures.parsedModels().toString());
      await http.post(
        Uri.http(apiPath, '/api/admin/caseDesignFeatures'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CaseDesignFeatures caseDesignFeatures) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = caseDesignFeatures.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/caseDesignFeatures/${caseDesignFeatures.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}

import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GraphicCardRepository implements Repository<GraphicCard> {
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
      Uri.http(apiPath, '/api/admin/graphicCard/$id'),
      headers: header,
    );
  }

  @override
  Future<List<GraphicCard>> getAllData() async {
    List<GraphicCard> graphicCard = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/graphicCard'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      graphicCard = data.map((e) => GraphicCard.fromJson(e)).toList();
    }

    return graphicCard;
  }

  @override
  Future<GraphicCard?> getDataById(int? id) async {
    GraphicCard? graphicCard;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/graphicCard/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      graphicCard = GraphicCard.fromJson(jsonData);
    }

    return graphicCard;
  }

  @override
  Future<void> postData(GraphicCard graphicCard) async {
    final token = await _getToken();
    try {
      final jsonData = graphicCard.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/graphicCard'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(GraphicCard graphicCard) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = graphicCard.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/graphicCard/${graphicCard.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:starwars_app/models/people_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = "https://swapi.dev/api/people/";
  var dio = new Dio();

  Future<List<People>> fetchData() async {
    List<People> peopleList;
    var res = await http.get(Uri.parse(url));

    var data = json.decode(res.body);
    var rest = data['results'] as List;
    peopleList = rest.map((json) => People.fromJson(json)).toList();

    return peopleList;
  }
}

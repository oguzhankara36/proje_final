import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase/api/albums_models.dart';
Future<List<BurcListe>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://gist.githubusercontent.com/oguzhankara36/3caabaec285d788f78f740463d3ebd45/raw/d1e8a5f4cb651121f3696d2af1e7b75392fe7ae3/burc_liste.json'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new BurcListe.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
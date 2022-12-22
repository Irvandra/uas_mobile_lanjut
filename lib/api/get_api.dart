import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/lembaga.dart';

class GetApi {
  static final dio = Dio();

  Future<String> getToken() async {
    var formData = FormData.fromMap({
      'id_aplikasi': '948df317-78f7-4b92-a53f-0a56215e07de',
      'username': 'mhs-testing',
      'password': 'unilajaya',
    });
    var response = await dio.post('http://onedata.unila.ac.id/api/live/0.1/auth/login', data: formData);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return json['data']['type'] + json['data']['token'];
    } else {
      throw Exception('Failed to load token');
    }
  }

  Future<List<Lembaga>> getLembaga() async {
    dio.options.headers['Authorization'] = await getToken();
    var response = await dio.get('http://onedata.unila.ac.id/api/live/0.1/lembaga/profil_prodi/daftar?page=1&limit=25&sort_by=DESC');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      if (json['data'] != null) {
        final lembaga = <Lembaga>[];
        json['data'].forEach((v) {
          lembaga.add(Lembaga.fromJson(v));
        });
        return lembaga;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load lembaga');
    }
  }
}
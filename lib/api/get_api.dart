import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/dashboard_data.dart';
import '../models/lembaga.dart';
import '../models/mata_kuliah.dart';

class GetApi {
  static final dio = Dio();

  Future<DashboardData> getDashboardData(int page) async {
    final todayRecipes = await getMataKuliah(page);

    return DashboardData(todayRecipes);
  }

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
    var response = await dio.get('http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      if (json['data'] != null) {
        final lembaga = <Lembaga>[];
        json['data'].forEach((v) {
          if (v['id_jns_sms'] == '1') {
            lembaga.add(Lembaga.fromJson(v));
          }
        });
        return lembaga;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load lembaga');
    }
  }

  Future<List<MataKuliah>> getMataKuliah(int page) async {
    dio.options.headers['Authorization'] = await getToken();
    var response = await dio.get('http://onedata.unila.ac.id/api/live/0.1/mata_kuliah/list_matkul?page=$page&limit=50&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      if (json['data'] != null) {
        final mataKuliah = <MataKuliah>[];
        json['data'].forEach((v) {
          mataKuliah.add(MataKuliah.fromJson(v));
        });
        return mataKuliah;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load mata kuliah');
    }
  }
}
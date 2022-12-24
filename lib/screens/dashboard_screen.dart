import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/components/dashboard_lembaga_list_view.dart';

import '../api/get_api.dart';
import '../models/dashboard_data.dart';
import '../models/mata_kuliah.dart';
import '../components/dashboard_mata_kuliah_list_view.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApi().getDashboardData(),
      builder: (context, AsyncSnapshot<DashboardData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              DashboardLembagaListView(),
              DashboardMataKuliahListView(mataKuliah: snapshot.data?.mataKuliah ?? [])
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

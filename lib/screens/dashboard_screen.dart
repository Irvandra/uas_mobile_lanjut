import 'package:flutter/material.dart';

import '../api/get_api.dart';
import '../models/mata_kuliah.dart';
import '../components/dashboard_mata_kuliah_list_view.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApi().getMataKuliah(),
      builder: (context, AsyncSnapshot<List<MataKuliah>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DashboardMataKuliahListView(mataKuliah: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';
import 'dashboard_mata_kuliah_thumbnail.dart';

class DashboardMataKuliahListView extends StatelessWidget {
  final List<MataKuliah> mataKuliah;

  const DashboardMataKuliahListView({
    super.key,
    required this.mataKuliah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: mataKuliah.length,
        itemBuilder: (context, index) {
          final _mataKuliah = mataKuliah[index];
          return DashboardMataKuliahThumbnail(mataKuliah: _mataKuliah);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';
import 'dashboard_mata_kuliah_tile.dart';

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
      child: ListView.separated(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: mataKuliah.length,
        itemBuilder: (context, index) {
          final _mataKuliah = mataKuliah[index];
          return DashboardMataKuliahTile(mataKuliah: _mataKuliah);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 2.0);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/mata_kuliah.dart';

class DashboardLembagaThumbnail extends StatelessWidget {
  final MataKuliah mataKuliah;

  const DashboardLembagaThumbnail({
    super.key,
    required this.mataKuliah,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mataKuliah.nm_mk,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Status : ' + mataKuliah.status,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'SKS : ' + mataKuliah.sks_mk,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
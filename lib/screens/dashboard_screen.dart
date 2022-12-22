import 'package:flutter/material.dart';

import '../api/get_api.dart';
import '../models/lembaga.dart';
import '../components/lembaga_list_view.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApi().getLembaga(),
      builder: (context, AsyncSnapshot<List<Lembaga>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LembagaListView(lembaga: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import '../models/mata_kuliah_manager.dart';
import 'empty_mata_kuliah_screen.dart';
import 'mata_kuliah_list_screen.dart';

class MataKuliahScreen extends StatelessWidget {
  const MataKuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          context.goNamed(
            'item',
            params: {
              'tab': '${UnilaTab.matkul}',
              'id': 'new',
            },
          );
        },
      ),
      body: buildMataKuliahScreen(),
    );
  }

  Widget buildMataKuliahScreen() {
    return Consumer<MataKuliahManager>(
      builder: (context, manager, child) {
        if (manager.mataKuliahItems.isNotEmpty) {
          return MataKuliahListScreen(manager: manager);
        } else {
          return const EmptyMataKuliahScreen();
        }
      },
    );
  }
}

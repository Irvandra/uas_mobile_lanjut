import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/mata_kuliah_tile.dart';
import '../models/app_state_manager.dart';
import '../models/mata_kuliah_manager.dart';

class MataKuliahListScreen extends StatelessWidget {
  final MataKuliahManager manager;

  const MataKuliahListScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    final mataKuliahItems = manager.mataKuliahItems;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: mataKuliahItems.length,
        itemBuilder: (context, index) {
          final item = mataKuliahItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16.0),
              child: const Icon(
                Icons.delete_sweep_outlined,
                color: Colors.red,
                size: 40.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dihapus'),
                ),
              );
            },
            child: InkWell(
              child: MataKuliahTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                final itemId = manager.getItemId(index);
                context.goNamed(
                  'item',
                  params: {
                    'tab': '${UnilaTab.matkul}',
                    'id': itemId,
                  },
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4.0);
        },
      ),
    );
  }
}

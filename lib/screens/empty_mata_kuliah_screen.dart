import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/app_state_manager.dart';

class EmptyMataKuliahScreen extends StatelessWidget {
  const EmptyMataKuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/task.png',
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Semua Tugas Telah Anda Selesaikan',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

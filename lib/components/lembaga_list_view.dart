import 'package:flutter/material.dart';
import 'lembaga_thumbnail.dart';
import '../models/lembaga.dart';

class LembagaListView extends StatelessWidget {
  final List<Lembaga> lembaga;

  const LembagaListView({
    super.key,
    required this.lembaga,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: lembaga.length,
        itemBuilder: (context, index) {
          final _lembaga = lembaga[index];
          return LembagaThumbnail(lembaga: _lembaga);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/lembaga_thumbnail.dart';
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
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: ListView.builder(
        itemCount: lembaga.length,
        itemBuilder: (context, index) {
          final simpleRecipe = lembaga[index];
          return LembagaThumbnail(lembaga: simpleRecipe);
        },
      ),
    );
  }
}

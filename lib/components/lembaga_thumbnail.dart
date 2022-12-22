import 'package:flutter/material.dart';

import '../models/lembaga.dart';

class LembagaThumbnail extends StatelessWidget {
  final Lembaga lembaga;

  const LembagaThumbnail({
    super.key,
    required this.lembaga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            lembaga.nm_prodi,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
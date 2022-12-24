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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset('assets/fakultas.png'),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 4,
              child: Text(
                lembaga.nm_jns_sms.toUpperCase() + " " + lembaga.nm_lemb,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
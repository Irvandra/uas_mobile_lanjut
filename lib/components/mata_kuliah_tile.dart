import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/mata_kuliah_item.dart';

class MataKuliahTile extends StatelessWidget {
  final MataKuliahItem item;
  final Function(bool?)? onComplete;

  MataKuliahTile({
    super.key,
    required this.item,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 4.0),
                buildDate(),
                const SizedBox(height: 4.0),
              ],
            ),
            buildCheckbox(),
          ],
        ),
      ),
    );
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('dd MMMM yyyy HH:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
    );
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}

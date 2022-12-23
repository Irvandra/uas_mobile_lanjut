import 'package:flutter/painting.dart';

class MataKuliahItem {
  final String id;
  final String name;
  final DateTime date;
  final bool isComplete;

  MataKuliahItem({
    required this.id,
    required this.name,
    required this.date,
    this.isComplete = false,
  });

  MataKuliahItem copyWith(
      {String? id,
      String? name,
      Color? color,
      DateTime? date,
      bool? isComplete}) {
    return MataKuliahItem(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

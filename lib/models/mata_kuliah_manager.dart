import 'package:flutter/material.dart';

import 'mata_kuliah_item.dart';

class MataKuliahManager extends ChangeNotifier {
  final _mataKuliahItems = <MataKuliahItem>[];
  List<MataKuliahItem> get mataKuliahItems => List.unmodifiable(_mataKuliahItems);

  void deleteItem(int index) {
    _mataKuliahItems.removeAt(index);
    notifyListeners();
  }

  String getItemId(int index) {
    final mataKuliahItem = _mataKuliahItems[index];
    return mataKuliahItem.id;
  }

  MataKuliahItem? getMataKuliahItem(String id) {
    final index = _mataKuliahItems.indexWhere((element) => element.id == id);
    if (index == -1) return null;
    return mataKuliahItems[index];
  }

  void addItem(MataKuliahItem item) {
    _mataKuliahItems.add(item);
    notifyListeners();
  }

  void updateItem(MataKuliahItem item) {
    final index = _mataKuliahItems.indexWhere((element) => element.id == item.id);
    _mataKuliahItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _mataKuliahItems[index];
    _mataKuliahItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}

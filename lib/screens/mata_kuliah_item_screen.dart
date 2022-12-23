import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/app_state_manager.dart';
import '../models/mata_kuliah_item.dart';

class MataKuliahItemScreen extends StatefulWidget {
  final Function(MataKuliahItem) onCreate;
  final Function(MataKuliahItem) onUpdate;
  final MataKuliahItem? originalItem;
  final int index;
  final bool isUpdating;

  const MataKuliahItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
    this.index = -1,
  }) : isUpdating = (originalItem != null);

  @override
  MataKuliahItemScreenState createState() => MataKuliahItemScreenState();
}

class MataKuliahItemScreenState extends State<MataKuliahItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.blue;
  int _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final mataKuliahItem = MataKuliahItem(
                id: widget.originalItem?.id ?? const Uuid().v1(),
                name: _nameController.text,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              );

              if (widget.isUpdating) {
                widget.onUpdate(mataKuliahItem);
              } else {
                widget.onCreate(mataKuliahItem);
              }

              context.goNamed(
                'home',
                params: {
                  'tab': '${UnilaTab.matkul}',
                },
              );
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          'Mata Kuliah',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(height: 10.0),
            Text(
              'Batas Waktu',
              style: Theme.of(context).textTheme.headline2,
            ),
            buildDateField(context),
            buildTimeField(context),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Judul Tugas',
          style: Theme.of(context).textTheme.headline2,
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'Isi judul tugas',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanggal',
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
              child: const Text('Pilih'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text(DateFormat('dd MMMM yyyy').format(_dueDate)),
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Waktu',
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
              child: const Text('Pilih'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
          ],
        ),
        Text(_timeOfDay.format(context)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _name = originalItem.name;
      _nameController.text = originalItem.name;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

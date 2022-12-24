import 'package:flutter/material.dart';

class DashboardLembagaListView extends StatelessWidget {
  final List<String> namaLembaga = const <String>['Fakultas', 'Jurusan', 'Prodi'];
  final List<String> jumlahLembaga = const <String>['10', '38', '150'];
  final List warnaLembaga = const [Color(0xff48cae4), Color(0xff00b4d8), Color(0xff0096c7)];

  DashboardLembagaListView({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: warnaLembaga[index],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    namaLembaga[index],
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    jumlahLembaga[index],
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0
        ),
      ),
    );
  }
}

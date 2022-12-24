import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/components/dashboard_lembaga_list_view.dart';
import 'package:uas_mobile_lanjut/models/profile_manager.dart';

import '../api/get_api.dart';
import '../models/dashboard_data.dart';
import '../components/dashboard_mata_kuliah_list_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApi().getDashboardData(page),
      builder: (context, AsyncSnapshot<DashboardData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 10.0, left: 10.0),
                child: Text(
                  "Hello, " + ProfileManager().getUser.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              DashboardLembagaListView(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () {
                            if(page != 1) {
                              setState(() {
                                page--;
                              });
                            }
                          },
                        ),
                        Text(
                          'Mata Kuliah',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_rounded),
                          onPressed: () {
                            if(page != 3) {
                              setState(() {
                                page++;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DashboardMataKuliahListView(mataKuliah: snapshot.data?.mataKuliah ?? [])
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

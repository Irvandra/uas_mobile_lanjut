import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/circle_image.dart';
import '../models/app_state_manager.dart';
import '../models/profile_manager.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final int currentTab;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.currentTab,
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UnilaApp',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              Provider.of<AppStateManager>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            buildDarkModeRow(),
          ],
        ),
      ),
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 60.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
      ],
    );
  }
}

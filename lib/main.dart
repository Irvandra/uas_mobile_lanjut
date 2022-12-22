import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'unila_theme.dart';
import 'models/app_state_manager.dart';
import 'models/mata_kuliah_manager.dart';
import 'models/profile_manager.dart';
import 'navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await appStateManager.initializeApp();
  runApp(Unila(appStateManager: appStateManager));
}

class Unila extends StatefulWidget {
  final AppStateManager appStateManager;

  const Unila({
    super.key,
    required this.appStateManager,
  });

  @override
  UnilaState createState() => UnilaState();
}

class UnilaState extends State<Unila> {
  late final _mataKuliahManager = MataKuliahManager();
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRouter(
    widget.appStateManager,
    _mataKuliahManager,
    _profileManager,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _mataKuliahManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = UnilaTheme.dark();
          } else {
            theme = UnilaTheme.light();
          }

          final router = _appRouter.router;

          return MaterialApp.router(
            theme: theme,
            title: 'Unila',
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}

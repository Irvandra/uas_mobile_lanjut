import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/app_state_manager.dart';
import '../models/mata_kuliah_manager.dart';
import '../models/profile_manager.dart';
import '../screens/home.dart';
import '../screens/login_screen.dart';
import '../screens/mata_kuliah_item_screen.dart';
import '../screens/profile_screen.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final MataKuliahManager mataKuliahManager;
  final ProfileManager profileManager;

  AppRouter(this.appStateManager, this.mataKuliahManager, this.profileManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
          return Home(key: state.pageKey, currentTab: tab);
        },
        routes: [
          GoRoute(
            name: 'item',
            path: 'item/:id',
            builder: (context, state) {
              final itemId = state.params['id'] ?? '';
              final item = mataKuliahManager.getMataKuliahItem(itemId);
              return MataKuliahItemScreen(
                originalItem: item,
                onCreate: (item) {
                  mataKuliahManager.addItem(item);
                },
                onUpdate: (item) {
                  mataKuliahManager.updateItem(item);
                },
              );
            },
          ),
          GoRoute(
            name: 'profile',
            path: 'profile',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return ProfileScreen(
                user: profileManager.getUser, currentTab: tab);
            },
          ),
        ],
      ),
    ],
    redirect: ((context, state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      if (loggingIn) return '/${UnilaTab.dashboard}';
      return null;
    }),
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}

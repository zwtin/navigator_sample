import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/settings/about_page.dart';
import '../../presentation/settings/licenses_page.dart';
import '../../presentation/settings/settings_page.dart';
import '../../presentation/todo_detail/todo_detail_page.dart';
import '../../presentation/todo_list/todo_list_page.dart';
import 'shell_scaffold.dart';

// 各ブランチ（タブ）専用のNavigatorKey
// これにより各タブが独立したナビゲーションスタックを持つ
final _todoNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'todo-tab');
final _settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings-tab');

/// GoRouterのProvider
/// StatefulShellRouteで複数タブの独立したスタックを管理する
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/todos',
    routes: [
      // StatefulShellRoute: 各ブランチが独立したNavigatorを持つ
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScaffold(navigationShell: navigationShell);
        },
        branches: [
          // ── Branch 0: Todoタブ ──
          StatefulShellBranch(
            navigatorKey: _todoNavigatorKey,
            routes: [
              GoRoute(
                path: '/todos',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: TodoListPage(),
                ),
                routes: [
                  // /todos/:id → Todo詳細画面
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return MaterialPage(child: TodoDetailPage(todoId: id));
                    },
                  ),
                ],
              ),
            ],
          ),
          // ── Branch 1: 設定タブ ──
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SettingsPage(),
                ),
                routes: [
                  // /settings/about → アプリについて画面
                  GoRoute(
                    path: 'about',
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: AboutPage()),
                  ),
                  // /settings/licenses → ライセンス情報画面
                  GoRoute(
                    path: 'licenses',
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: LicensesPage()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

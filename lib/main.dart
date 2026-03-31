import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app/router/app_router.dart';
import 'data/repository/todo_repository_impl.dart';
import 'domain/repository/todo_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        todoRepositoryProvider.overrideWithValue(TodoRepositoryImpl()),
      ],
      child: const App(),
    ),
  );
}

/// アプリのルートWidget
/// routerProviderを通じてGoRouterを取得し、MaterialApp.routerに渡す
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Clean Architecture Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

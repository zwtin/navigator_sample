import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/repository/todo_repository.dart';
import '../../domain/service/navigation_service.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/delete_todo_usecase.dart';
import '../../domain/usecase/get_todo_usecase.dart';
import '../../domain/usecase/get_todos_usecase.dart';
import '../../domain/usecase/toggle_todo_usecase.dart';
import '../repository/todo_repository_impl.dart';

// ──────────────────────────────────────────────
// Repository
// ──────────────────────────────────────────────

/// TodoRepositoryのProvider
/// テスト時はここをoverrideしてモックを差し込む
final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(),
);

// ──────────────────────────────────────────────
// UseCases
// ──────────────────────────────────────────────

final getTodosUseCaseProvider = Provider(
  (ref) => GetTodosUseCase(ref.watch(todoRepositoryProvider)),
);

final getTodoUseCaseProvider = Provider(
  (ref) => GetTodoUseCase(ref.watch(todoRepositoryProvider)),
);

final addTodoUseCaseProvider = Provider(
  (ref) => AddTodoUseCase(ref.watch(todoRepositoryProvider)),
);

final toggleTodoUseCaseProvider = Provider(
  (ref) => ToggleTodoUseCase(ref.watch(todoRepositoryProvider)),
);

final deleteTodoUseCaseProvider = Provider(
  (ref) => DeleteTodoUseCase(ref.watch(todoRepositoryProvider)),
);

// ──────────────────────────────────────────────
// NavigationService
// ──────────────────────────────────────────────

/// GoRouterを使ったNavigationServiceの実装
/// ViewModelはこのサービス経由でナビゲートするため、BuildContextが不要
class GoRouterNavigationService implements NavigationService {
  GoRouterNavigationService(this._router);

  final GoRouter _router;

  @override
  void navigateTo(String path) => _router.go(path);

  @override
  void goBack() => _router.pop();
}

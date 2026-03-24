import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/provider/repository_providers.dart';
import '../../domain/entity/todo.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/delete_todo_usecase.dart';
import '../../domain/usecase/get_todos_usecase.dart';
import '../../domain/usecase/toggle_todo_usecase.dart';
import 'todo_list_state.dart';

/// TodoList画面のViewModel
/// - AsyncNotifier[TodoListState]: 非同期の初期ロードを表現
/// - build()内でref.watchによりUseCaseを取得（DI）
/// - BuildContextへの依存なし
class TodoListViewModel extends AsyncNotifier<TodoListState> {
  late final GetTodosUseCase _getTodosUseCase;
  late final AddTodoUseCase _addTodoUseCase;
  late final ToggleTodoUseCase _toggleTodoUseCase;
  late final DeleteTodoUseCase _deleteTodoUseCase;

  @override
  Future<TodoListState> build() async {
    // build()内でref.watchによりUseCaseを注入（依存関係が変わると自動再build）
    _getTodosUseCase = ref.watch(getTodosUseCaseProvider);
    _addTodoUseCase = ref.watch(addTodoUseCaseProvider);
    _toggleTodoUseCase = ref.watch(toggleTodoUseCaseProvider);
    _deleteTodoUseCase = ref.watch(deleteTodoUseCaseProvider);

    final todos = await _getTodosUseCase.execute();
    return TodoListState(todos: todos);
  }

  /// Todo追加
  Future<void> addTodo(String title) async {
    final currentState = state.value;
    if (currentState == null) return;

    final newTodo = Todo(
      id: const Uuid().v4(),
      title: title,
      createdAt: DateTime.now(),
    );

    // Push-based更新: Loadingにせず即時UIを更新
    state = AsyncData(currentState.copyWith(isLoading: true));
    await _addTodoUseCase.execute(newTodo);
    final todos = await _getTodosUseCase.execute();
    state = AsyncData(currentState.copyWith(todos: todos, isLoading: false));
  }

  /// Todo完了状態切替
  Future<void> toggleTodo(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    // 楽観的更新: APIレスポンスを待たずにUIを即時反映
    final updatedTodos = currentState.todos.map((todo) {
      return todo.id == id
          ? todo.copyWith(isCompleted: !todo.isCompleted)
          : todo;
    }).toList();
    state = AsyncData(currentState.copyWith(todos: updatedTodos));

    await _toggleTodoUseCase.execute(id);
  }

  /// Todo削除
  Future<void> deleteTodo(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    // 楽観的更新
    final updatedTodos =
        currentState.todos.where((todo) => todo.id != id).toList();
    state = AsyncData(currentState.copyWith(todos: updatedTodos));

    await _deleteTodoUseCase.execute(id);
  }
}

final todoListViewModelProvider =
    AsyncNotifierProvider<TodoListViewModel, TodoListState>(
  TodoListViewModel.new,
);

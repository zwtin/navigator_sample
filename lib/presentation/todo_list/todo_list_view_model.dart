import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entity/todo.dart';
import '../../domain/usecase/todo_usecase.dart';
import 'todo_list_state.dart';

/// TodoList画面のViewModel
class TodoListViewModel extends AsyncNotifier<TodoListState> {
  late final TodoUseCase _todoUseCase;

  @override
  Future<TodoListState> build() async {
    _todoUseCase = ref.watch(todoUseCaseProvider);

    final todos = await _todoUseCase.getTodos();
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
    await _todoUseCase.addTodo(newTodo);
    final todos = await _todoUseCase.getTodos();
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

    await _todoUseCase.toggleTodo(id);
  }

  /// Todo削除
  Future<void> deleteTodo(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    // 楽観的更新
    final updatedTodos =
        currentState.todos.where((todo) => todo.id != id).toList();
    state = AsyncData(currentState.copyWith(todos: updatedTodos));

    await _todoUseCase.deleteTodo(id);
  }
}

final todoListViewModelProvider =
    AsyncNotifierProvider<TodoListViewModel, TodoListState>(
  TodoListViewModel.new,
);

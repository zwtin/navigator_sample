import 'package:domain/domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../view_data/todo_list_view_data.dart';

/// TodoList画面のViewModel
class TodoListViewModel extends AutoDisposeFamilyAsyncNotifier<TodoListViewData, String> {
  late final TodoUseCase _todoUseCase;

  @override
  Future<TodoListViewData> build(String key) async {
    _todoUseCase = ref.watch(todoUseCaseProvider(key));

    final todos = await _todoUseCase.getTodos();
    return TodoListViewData(todos: todos);
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

    state = AsyncData(currentState.copyWith(isLoading: true));
    await _todoUseCase.addTodo(newTodo);
    final todos = await _todoUseCase.getTodos();
    state = AsyncData(currentState.copyWith(todos: todos, isLoading: false));
  }

  /// Todo完了状態切替
  Future<void> toggleTodo(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

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

    final updatedTodos =
        currentState.todos.where((todo) => todo.id != id).toList();
    state = AsyncData(currentState.copyWith(todos: updatedTodos));

    await _todoUseCase.deleteTodo(id);
  }
}

final todoListViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<TodoListViewModel, TodoListViewData, String>(
  TodoListViewModel.new,
);

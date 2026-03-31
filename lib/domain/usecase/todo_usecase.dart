import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../entity/todo.dart';
import '../repository/todo_repository.dart';

class TodoUseCase {
  TodoUseCase(this._repository);

  final TodoRepository _repository;

  Future<List<Todo>> getTodos() => _repository.getTodos();
  Future<Todo?> getTodoById(String id) => _repository.getTodoById(id);
  Future<void> addTodo(Todo todo) => _repository.addTodo(todo);
  Future<void> toggleTodo(String id) => _repository.toggleTodo(id);
  Future<void> deleteTodo(String id) => _repository.deleteTodo(id);
}

final todoUseCaseProvider = Provider(
  (ref) => TodoUseCase(ref.watch(todoRepositoryProvider)),
);

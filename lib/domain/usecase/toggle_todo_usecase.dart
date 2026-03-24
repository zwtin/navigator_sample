import '../repository/todo_repository.dart';

/// Todo完了状態切替ユースケース
class ToggleTodoUseCase {
  ToggleTodoUseCase(this._repository);

  final TodoRepository _repository;

  Future<void> execute(String id) => _repository.toggleTodo(id);
}

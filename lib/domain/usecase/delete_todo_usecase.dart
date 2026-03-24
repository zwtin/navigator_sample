import '../repository/todo_repository.dart';

/// Todo削除ユースケース
class DeleteTodoUseCase {
  DeleteTodoUseCase(this._repository);

  final TodoRepository _repository;

  Future<void> execute(String id) => _repository.deleteTodo(id);
}

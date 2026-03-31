import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../entity/todo.dart';
import '../repository/todo_repository.dart';

/// Todo追加ユースケース
class AddTodoUseCase {
  AddTodoUseCase(this._repository);

  final TodoRepository _repository;

  Future<void> execute(Todo todo) => _repository.addTodo(todo);
}

final addTodoUseCaseProvider = Provider(
  (ref) => AddTodoUseCase(ref.watch(todoRepositoryProvider)),
);

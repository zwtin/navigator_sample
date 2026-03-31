import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../entity/todo.dart';
import '../repository/todo_repository.dart';

/// 単一Todo取得ユースケース
class GetTodoUseCase {
  GetTodoUseCase(this._repository);

  final TodoRepository _repository;

  Future<Todo?> execute(String id) => _repository.getTodoById(id);
}

final getTodoUseCaseProvider = Provider(
  (ref) => GetTodoUseCase(ref.watch(todoRepositoryProvider)),
);

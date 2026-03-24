import '../entity/todo.dart';
import '../repository/todo_repository.dart';

/// Todo一覧取得ユースケース
/// ビジネスロジックはここに記述する（バリデーション、フィルタリング等）
class GetTodosUseCase {
  GetTodosUseCase(this._repository);

  final TodoRepository _repository;

  Future<List<Todo>> execute() => _repository.getTodos();
}

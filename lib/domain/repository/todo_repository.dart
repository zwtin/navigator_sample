import '../entity/todo.dart';

/// TodoリポジトリのInterface
/// Domain層に定義し、Data層で実装する。
/// これにより、Data層の実装詳細をDomain/Presentation層から隠蔽する。
abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo?> getTodoById(String id);
  Future<void> addTodo(Todo todo);
  Future<void> toggleTodo(String id);
  Future<void> deleteTodo(String id);
}

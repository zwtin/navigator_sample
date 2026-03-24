import 'package:uuid/uuid.dart';
import '../../domain/entity/todo.dart';
import '../../domain/repository/todo_repository.dart';

/// TodoリポジトリのData層実装
/// 本サンプルではインメモリのフェイクデータを使用する。
/// 実際のアプリではAPI呼び出しやローカルDBへのアクセスがここに入る。
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl() {
    // サンプルデータを初期化
    final now = DateTime.now();
    _todos.addAll([
      Todo(
        id: const Uuid().v4(),
        title: 'Flutterのドキュメントを読む',
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      Todo(
        id: const Uuid().v4(),
        title: 'Clean Architectureを実装する',
        isCompleted: true,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
      Todo(
        id: const Uuid().v4(),
        title: 'Riverpodのベストプラクティスを学ぶ',
        createdAt: now,
      ),
    ]);
  }

  final List<Todo> _todos = [];

  /// API呼び出しを模倣した遅延を追加
  Future<void> _delay() =>
      Future.delayed(const Duration(milliseconds: 300));

  @override
  Future<List<Todo>> getTodos() async {
    await _delay();
    return List.unmodifiable(_todos);
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    await _delay();
    try {
      return _todos.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _delay();
    _todos.add(todo);
  }

  @override
  Future<void> toggleTodo(String id) async {
    await _delay();
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        isCompleted: !_todos[index].isCompleted,
      );
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _delay();
    _todos.removeWhere((t) => t.id == id);
  }
}

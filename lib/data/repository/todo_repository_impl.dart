import 'package:uuid/uuid.dart';
import '../../domain/entity/todo.dart';
import '../../domain/repository/todo_repository.dart';
import '../dao/todo_dao.dart';
import '../mapper/todo_mapper.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl() {
    final now = DateTime.now();
    _todos.addAll([
      TodoDAO(
        id: const Uuid().v4(),
        title: 'Flutterのドキュメントを読む',
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      TodoDAO(
        id: const Uuid().v4(),
        title: 'Clean Architectureを実装する',
        isCompleted: true,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
      TodoDAO(
        id: const Uuid().v4(),
        title: 'Riverpodのベストプラクティスを学ぶ',
        createdAt: now,
      ),
    ]);
  }

  final List<TodoDAO> _todos = [];

  Future<void> _delay() =>
      Future.delayed(const Duration(milliseconds: 300));

  @override
  Future<List<Todo>> getTodos() async {
    await _delay();
    return _todos.map(TodoMapper.toEntity).toList();
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    await _delay();
    try {
      final dao = _todos.firstWhere((t) => t.id == id);
      return TodoMapper.toEntity(dao);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _delay();
    _todos.add(TodoMapper.toDAO(todo));
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

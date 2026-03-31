import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  late TodoRepositoryImpl repository;

  setUp(() {
    repository = TodoRepositoryImpl();
  });

  group('getTodos', () {
    test('初期状態でサンプルデータが3件あること', () async {
      final todos = await repository.getTodos();

      expect(todos, hasLength(3));
    });

    test('返却される要素がTodo型であること', () async {
      final todos = await repository.getTodos();

      expect(todos, everyElement(isA<Todo>()));
    });
  });

  group('getTodoById', () {
    test('存在するIDでTodoを取得できること', () async {
      final todos = await repository.getTodos();
      final firstId = todos.first.id;

      final todo = await repository.getTodoById(firstId);

      expect(todo, isNotNull);
      expect(todo!.id, firstId);
    });

    test('存在しないIDの場合nullを返すこと', () async {
      final todo = await repository.getTodoById('non-existent');

      expect(todo, isNull);
    });
  });

  group('addTodo', () {
    test('Todoを追加できること', () async {
      final newTodo = Todo(
        id: 'new-1',
        title: '新しいTodo',
        createdAt: DateTime(2026, 1, 1),
      );

      await repository.addTodo(newTodo);
      final todos = await repository.getTodos();

      expect(todos, hasLength(4));
      expect(todos.any((t) => t.id == 'new-1'), isTrue);
    });
  });

  group('toggleTodo', () {
    test('未完了のTodoを完了にできること', () async {
      final todos = await repository.getTodos();
      final uncompletedTodo = todos.firstWhere((t) => !t.isCompleted);

      await repository.toggleTodo(uncompletedTodo.id);
      final updated = await repository.getTodoById(uncompletedTodo.id);

      expect(updated!.isCompleted, isTrue);
    });

    test('完了のTodoを未完了に戻せること', () async {
      final todos = await repository.getTodos();
      final completedTodo = todos.firstWhere((t) => t.isCompleted);

      await repository.toggleTodo(completedTodo.id);
      final updated = await repository.getTodoById(completedTodo.id);

      expect(updated!.isCompleted, isFalse);
    });
  });

  group('deleteTodo', () {
    test('Todoを削除できること', () async {
      final todos = await repository.getTodos();
      final firstId = todos.first.id;

      await repository.deleteTodo(firstId);
      final afterDelete = await repository.getTodos();

      expect(afterDelete, hasLength(2));
      expect(afterDelete.any((t) => t.id == firstId), isFalse);
    });
  });
}

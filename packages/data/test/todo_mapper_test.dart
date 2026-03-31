import 'package:data/src/dao/todo_dao.dart';
import 'package:data/src/mapper/todo_mapper.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  final testDate = DateTime(2026, 1, 1);

  group('toEntity', () {
    test('TodoDAOからTodoに変換できること', () {
      final dao = TodoDAO(
        id: '1',
        title: 'テスト',
        isCompleted: true,
        createdAt: testDate,
      );

      final entity = TodoMapper.toEntity(dao);

      expect(entity.id, '1');
      expect(entity.title, 'テスト');
      expect(entity.isCompleted, isTrue);
      expect(entity.createdAt, testDate);
    });
  });

  group('toDAO', () {
    test('TodoからTodoDAOに変換できること', () {
      final entity = Todo(
        id: '1',
        title: 'テスト',
        isCompleted: true,
        createdAt: testDate,
      );

      final dao = TodoMapper.toDAO(entity);

      expect(dao.id, '1');
      expect(dao.title, 'テスト');
      expect(dao.isCompleted, isTrue);
      expect(dao.createdAt, testDate);
    });
  });

  group('往復変換', () {
    test('Entity -> DAO -> Entity で同一であること', () {
      final original = Todo(
        id: '1',
        title: 'テスト',
        isCompleted: false,
        createdAt: testDate,
      );

      final converted = TodoMapper.toEntity(TodoMapper.toDAO(original));

      expect(converted, original);
    });
  });
}

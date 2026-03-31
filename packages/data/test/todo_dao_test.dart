import 'package:data/src/dao/todo_dao.dart';
import 'package:test/test.dart';

void main() {
  final testDate = DateTime(2026, 1, 1);

  group('fromJson', () {
    test('JSONからTodoDAOを生成できること', () {
      final json = {
        'id': '1',
        'title': 'テスト',
        'isCompleted': true,
        'createdAt': '2026-01-01T00:00:00.000',
      };

      final dao = TodoDAO.fromJson(json);

      expect(dao.id, '1');
      expect(dao.title, 'テスト');
      expect(dao.isCompleted, isTrue);
      expect(dao.createdAt, testDate);
    });

    test('isCompletedが省略された場合デフォルトでfalseになること', () {
      final json = {
        'id': '1',
        'title': 'テスト',
        'createdAt': '2026-01-01T00:00:00.000',
      };

      final dao = TodoDAO.fromJson(json);

      expect(dao.isCompleted, isFalse);
    });
  });

  group('toJson', () {
    test('TodoDAOからJSONに変換できること', () {
      final dao = TodoDAO(
        id: '1',
        title: 'テスト',
        isCompleted: true,
        createdAt: testDate,
      );

      final json = dao.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'テスト');
      expect(json['isCompleted'], isTrue);
      expect(json['createdAt'], '2026-01-01T00:00:00.000');
    });
  });

  group('往復変換', () {
    test('toJson -> fromJson で同一であること', () {
      final original = TodoDAO(
        id: '1',
        title: 'テスト',
        isCompleted: false,
        createdAt: testDate,
      );

      final converted = TodoDAO.fromJson(original.toJson());

      expect(converted, original);
    });
  });
}

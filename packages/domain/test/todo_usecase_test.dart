import 'package:domain/domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository mockRepository;
  late ProviderContainer container;

  final testTodo = Todo(
    id: '1',
    title: 'テスト',
    createdAt: DateTime(2026, 1, 1),
  );

  setUp(() {
    mockRepository = MockTodoRepository();
    container = ProviderContainer(
      overrides: [
        todoRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  setUpAll(() {
    registerFallbackValue(testTodo);
  });

  TodoUseCase getUseCase() {
    return container.read(todoUseCaseProvider('test-key'));
  }

  group('getTodos', () {
    test('リポジトリからTodo一覧を取得できること', () async {
      when(() => mockRepository.getTodos())
          .thenAnswer((_) async => [testTodo]);

      final result = await getUseCase().getTodos();

      expect(result, [testTodo]);
      verify(() => mockRepository.getTodos()).called(1);
    });

    test('空のリストを返せること', () async {
      when(() => mockRepository.getTodos()).thenAnswer((_) async => []);

      final result = await getUseCase().getTodos();

      expect(result, isEmpty);
    });
  });

  group('getTodoById', () {
    test('IDでTodoを取得できること', () async {
      when(() => mockRepository.getTodoById('1'))
          .thenAnswer((_) async => testTodo);

      final result = await getUseCase().getTodoById('1');

      expect(result, testTodo);
      verify(() => mockRepository.getTodoById('1')).called(1);
    });

    test('存在しないIDの場合nullを返すこと', () async {
      when(() => mockRepository.getTodoById('999'))
          .thenAnswer((_) async => null);

      final result = await getUseCase().getTodoById('999');

      expect(result, isNull);
    });
  });

  group('addTodo', () {
    test('Todoを追加できること', () async {
      when(() => mockRepository.addTodo(any()))
          .thenAnswer((_) async {});

      await getUseCase().addTodo(testTodo);

      verify(() => mockRepository.addTodo(testTodo)).called(1);
    });
  });

  group('toggleTodo', () {
    test('Todoの完了状態を切り替えられること', () async {
      when(() => mockRepository.toggleTodo('1'))
          .thenAnswer((_) async {});

      await getUseCase().toggleTodo('1');

      verify(() => mockRepository.toggleTodo('1')).called(1);
    });
  });

  group('deleteTodo', () {
    test('Todoを削除できること', () async {
      when(() => mockRepository.deleteTodo('1'))
          .thenAnswer((_) async {});

      await getUseCase().deleteTodo('1');

      verify(() => mockRepository.deleteTodo('1')).called(1);
    });
  });
}

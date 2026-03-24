import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// Todoエンティティ
/// Domain層の中心的なデータ構造。全レイヤーで共有される。
@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

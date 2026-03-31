import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_dao.freezed.dart';
part 'todo_dao.g.dart';

@freezed
abstract class TodoDAO with _$TodoDAO {
  const factory TodoDAO({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
  }) = _TodoDAO;

  factory TodoDAO.fromJson(Map<String, dynamic> json) =>
      _$TodoDAOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/todo.dart';

part 'todo_list_view_data.freezed.dart';

@freezed
abstract class TodoListViewData with _$TodoListViewData {
  const factory TodoListViewData({
    @Default([]) List<Todo> todos,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TodoListViewData;
}

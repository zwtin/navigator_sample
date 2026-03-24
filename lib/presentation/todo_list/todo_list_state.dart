import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/todo.dart';

part 'todo_list_state.freezed.dart';

/// TodoList画面のState
/// 1-Screen 1-ViewModel 1-State パターン
@freezed
abstract class TodoListState with _$TodoListState {
  const factory TodoListState({
    @Default([]) List<Todo> todos,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TodoListState;
}

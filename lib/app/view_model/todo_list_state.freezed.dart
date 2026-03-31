// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoListState {
  List<Todo> get todos;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      _$TodoListStateCopyWithImpl<TodoListState>(
          this as TodoListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoListState &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(todos), isLoading, errorMessage);

  @override
  String toString() {
    return 'TodoListState(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) _then) =
      _$TodoListStateCopyWithImpl;
  @useResult
  $Res call({List<Todo> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._self, this._then);

  final TodoListState _self;
  final $Res Function(TodoListState) _then;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      todos: null == todos
          ? _self.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _TodoListState implements TodoListState {
  const _TodoListState(
      {final List<Todo> todos = const [],
      this.isLoading = false,
      this.errorMessage})
      : _todos = todos;

  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoListStateCopyWith<_TodoListState> get copyWith =>
      __$TodoListStateCopyWithImpl<_TodoListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListState &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), isLoading, errorMessage);

  @override
  String toString() {
    return 'TodoListState(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TodoListStateCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$TodoListStateCopyWith(
          _TodoListState value, $Res Function(_TodoListState) _then) =
      __$TodoListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Todo> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateCopyWith<$Res> {
  __$TodoListStateCopyWithImpl(this._self, this._then);

  final _TodoListState _self;
  final $Res Function(_TodoListState) _then;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todos = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_TodoListState(
      todos: null == todos
          ? _self._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

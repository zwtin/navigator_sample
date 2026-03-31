// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoListViewData {
  List<Todo> get todos;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of TodoListViewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoListViewDataCopyWith<TodoListViewData> get copyWith =>
      _$TodoListViewDataCopyWithImpl<TodoListViewData>(
          this as TodoListViewData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoListViewData &&
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
    return 'TodoListViewData(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TodoListViewDataCopyWith<$Res> {
  factory $TodoListViewDataCopyWith(
          TodoListViewData value, $Res Function(TodoListViewData) _then) =
      _$TodoListViewDataCopyWithImpl;
  @useResult
  $Res call({List<Todo> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$TodoListViewDataCopyWithImpl<$Res>
    implements $TodoListViewDataCopyWith<$Res> {
  _$TodoListViewDataCopyWithImpl(this._self, this._then);

  final TodoListViewData _self;
  final $Res Function(TodoListViewData) _then;

  /// Create a copy of TodoListViewData
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

class _TodoListViewData implements TodoListViewData {
  const _TodoListViewData(
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

  /// Create a copy of TodoListViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoListViewDataCopyWith<_TodoListViewData> get copyWith =>
      __$TodoListViewDataCopyWithImpl<_TodoListViewData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListViewData &&
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
    return 'TodoListViewData(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TodoListViewDataCopyWith<$Res>
    implements $TodoListViewDataCopyWith<$Res> {
  factory _$TodoListViewDataCopyWith(
          _TodoListViewData value, $Res Function(_TodoListViewData) _then) =
      __$TodoListViewDataCopyWithImpl;
  @override
  @useResult
  $Res call({List<Todo> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$TodoListViewDataCopyWithImpl<$Res>
    implements _$TodoListViewDataCopyWith<$Res> {
  __$TodoListViewDataCopyWithImpl(this._self, this._then);

  final _TodoListViewData _self;
  final $Res Function(_TodoListViewData) _then;

  /// Create a copy of TodoListViewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todos = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_TodoListViewData(
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

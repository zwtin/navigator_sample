// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_dao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoDAO {
  String get id;
  String get title;
  bool get isCompleted;
  DateTime get createdAt;

  /// Create a copy of TodoDAO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoDAOCopyWith<TodoDAO> get copyWith =>
      _$TodoDAOCopyWithImpl<TodoDAO>(this as TodoDAO, _$identity);

  /// Serializes this TodoDAO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoDAO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, isCompleted, createdAt);

  @override
  String toString() {
    return 'TodoDAO(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $TodoDAOCopyWith<$Res> {
  factory $TodoDAOCopyWith(TodoDAO value, $Res Function(TodoDAO) _then) =
      _$TodoDAOCopyWithImpl;
  @useResult
  $Res call({String id, String title, bool isCompleted, DateTime createdAt});
}

/// @nodoc
class _$TodoDAOCopyWithImpl<$Res> implements $TodoDAOCopyWith<$Res> {
  _$TodoDAOCopyWithImpl(this._self, this._then);

  final TodoDAO _self;
  final $Res Function(TodoDAO) _then;

  /// Create a copy of TodoDAO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TodoDAO implements TodoDAO {
  const _TodoDAO(
      {required this.id,
      required this.title,
      this.isCompleted = false,
      required this.createdAt});
  factory _TodoDAO.fromJson(Map<String, dynamic> json) =>
      _$TodoDAOFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime createdAt;

  /// Create a copy of TodoDAO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodoDAOCopyWith<_TodoDAO> get copyWith =>
      __$TodoDAOCopyWithImpl<_TodoDAO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodoDAOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoDAO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, isCompleted, createdAt);

  @override
  String toString() {
    return 'TodoDAO(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$TodoDAOCopyWith<$Res> implements $TodoDAOCopyWith<$Res> {
  factory _$TodoDAOCopyWith(_TodoDAO value, $Res Function(_TodoDAO) _then) =
      __$TodoDAOCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, bool isCompleted, DateTime createdAt});
}

/// @nodoc
class __$TodoDAOCopyWithImpl<$Res> implements _$TodoDAOCopyWith<$Res> {
  __$TodoDAOCopyWithImpl(this._self, this._then);

  final _TodoDAO _self;
  final $Res Function(_TodoDAO) _then;

  /// Create a copy of TodoDAO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? createdAt = null,
  }) {
    return _then(_TodoDAO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoDAO _$TodoDAOFromJson(Map<String, dynamic> json) => _TodoDAO(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TodoDAOToJson(_TodoDAO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
    };

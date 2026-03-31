import '../../domain/entity/todo.dart';
import '../dao/todo_dao.dart';

class TodoMapper {
  static Todo toEntity(TodoDAO dao) {
    return Todo(
      id: dao.id,
      title: dao.title,
      isCompleted: dao.isCompleted,
      createdAt: dao.createdAt,
    );
  }

  static TodoDAO toDAO(Todo entity) {
    return TodoDAO(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
    );
  }
}

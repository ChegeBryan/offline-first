import 'package:offline_first/domain/entities/todo/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> getTodos();
}

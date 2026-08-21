import 'package:injectable/injectable.dart';
import 'package:offline_first/domain/entities/todo/todo.dart';
import 'package:offline_first/domain/repository/todos_repository.dart';

@lazySingleton
class GetTodosUseCase {
  final TodosRepository repository;

  const GetTodosUseCase(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getTodos();
  }
}

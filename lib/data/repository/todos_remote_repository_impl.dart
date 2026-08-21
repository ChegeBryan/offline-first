import 'package:injectable/injectable.dart';
import 'package:offline_first/data/remote/todos_service.dart';
import 'package:offline_first/domain/entities/todo/todo.dart';
import 'package:offline_first/domain/repository/todos_repository.dart';
import 'package:offline_first/utils/result.dart';

@lazySingleton
final class TodosRemoteRepositoryImpl implements TodosRepository {
  final TodosService _todosService;

  const TodosRemoteRepositoryImpl(this._todosService);

  @override
  Future<Result<List<Todo>>> getTodos() async {
    return await _todosService.todos();
  }
}

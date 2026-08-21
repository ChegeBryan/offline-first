import 'package:injectable/injectable.dart';
import 'package:offline_first/domain/entities/todo/todo.dart';
import 'package:offline_first/domain/repository/todos_repository.dart';
import 'package:offline_first/utils/result.dart';

@lazySingleton
final class TodosLocalRepositoryImpl implements TodosRepository {
  const TodosLocalRepositoryImpl();

  @override
  Future<Result<List<Todo>>> getTodos() async {
    return;
  }
}

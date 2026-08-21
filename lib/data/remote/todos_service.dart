import 'package:offline_first/config/network/api_endpoints.dart';
import 'package:offline_first/config/network/network_service.dart';
import 'package:offline_first/domain/entities/todo/todo.dart';
import 'package:offline_first/utils/result.dart';

class TodosService {
  final NetworkClient _networkClient;

  const TodosService(this._networkClient);

  Future<Result<Todo>> todos() async {
    try {
      final endpoint = ApiEndpoints.getTodos();

      final response = await _networkClient.performRequest(endpoint);

      final challenges = Todo.fromJson(response.data);

      return Result.ok(challenges);
    } catch (e) {
      return Result.error(Exception('Error getting todos errored with: $e'));
    }
  }
}

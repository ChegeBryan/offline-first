import 'package:offline_first/config/network/endpoint.dart';

class ApiEndpoints extends Endpoint {
  @override
  final String path;
  @override
  final RequestMethod method;
  @override
  final RequestBody body;
  @override
  final bool needsAuth = true;
  @override
  Map<String, String>? queryParams;
  @override
  Map<String, String>? pathParams;

  ApiEndpoints._({
    required this.path,
    required this.method,
    this.body = const RequestBody.none(),
  });

  factory ApiEndpoints.getUser() {
    return ._(path: "/users/1", method: RequestMethod.get);
  }

  factory ApiEndpoints.getPosts() {
    return ._(path: "/posts", method: RequestMethod.get);
  }
  factory ApiEndpoints.getTodos() {
    return ._(
      path: "/todos",
      method: RequestMethod.get,
    );
  }
}

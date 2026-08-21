import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    required int id,
    required String todo,
    required bool completed,
    required int userId,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
    );
  }
}

part of 'todos_bloc.dart';

@freezed
sealed class TodosEvent {
  const factory TodosEvent.getTodos() = _GetTodos;
}

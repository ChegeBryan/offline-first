import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:offline_first/domain/repository/todos_repository.dart';
import 'package:offline_first/domain/usecases/get_todos_usecase.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final GetTodosUseCase _getTodosUseCase;
  TodosBloc() : super(TodosInitial()) {
    on<TodosEvent>(_GetTodos);
  }

  void _onGetTodos(
    final _GetTodos event,
    final Emitter<TodosState> emit,
  ) async {i
    emit(state.copyWith());
  }
}

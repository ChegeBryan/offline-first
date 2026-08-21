part of 'todos_bloc.dart';

@immutable
sealed class TodosState {}

final class TodosInitial extends TodosState {}

final class TodosLoaded extends TodosState {}

final class TodosLoading extends TodosState {}

final class TodosErrored extends TodosState {}

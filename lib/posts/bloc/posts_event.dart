part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

abstract class PostsEvent with _$PostsEvent {
  const factory PostsEvent.getPosts({})
}

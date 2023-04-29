part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListLoading extends ListState {}

class ListSuccess extends ListState {
  final List<UserEntity> users;

  const ListSuccess({required this.users});
}

class ListError extends ListState {
  final AppException exception;

  const ListError({required this.exception});

  @override
  List<Object> get props => [exception];
}

part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class ListStarted extends ListEvent {}

class ListRefresh extends ListEvent {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nexo_project/common/exceptions.dart';
import 'package:nexo_project/data/repository/user_repository.dart';
import 'package:nexo_project/data/user.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final IUserRepository userRepository;
  ListBloc({required this.userRepository}) : super(ListLoading()) {
    on<ListEvent>((event, emit) async {
      if (event is ListStarted || event is ListRefresh) {
        try {
          emit(ListLoading());
          final users = await userRepository.getAll();
          emit(ListSuccess(users: users));
        } catch (e) {
          emit(ListError(exception: e is AppException ? e : AppException()));
        }
      }
    });
  }
}

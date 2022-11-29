import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ivory/domine/models/user/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<UserEvent>((event, emit) {});
  }
}

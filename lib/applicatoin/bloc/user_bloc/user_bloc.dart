import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepo userRepo = UserRepo();

  UserBloc() : super(UserState.initial()) {
    on<InitialUserEvent>((event, emit) async {
      var userStream = userRepo.getUsers();

      await emit.forEach(userStream, onData: (users) {
        log(users.length.toString());
        return UserState(isLoadinng: false, isError: false, users: users);
      }).catchError((error) {
        emit(UserState(isLoadinng: false, isError: true, users: const []));
      });
    });
  }
}


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubsctription;

  AuthenticationBloc({
    required this.userRepository
  }) : super(const AuthenticationState.unknown()) {
    _userSubsctription = userRepository.user.listen((myUser){
      add(AuthenticationUserChanged(myUser));
    });

    on<AuthenticationUserChanged>((event, emit) {
      if(event.myUser != MyUser.empty) {
        emit(AuthenticationState.authenticated(event.myUser!));
      } else{
        emit(AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _userSubsctription.cancel();
    return super.close();
  }
}
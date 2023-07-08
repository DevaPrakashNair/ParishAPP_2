

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/WithoutLoginModel.dart';
import '../data/repository.dart';

class WithoutLogin extends Bloc<DisEvent, DisState> {
  WithoutLogin() : super(DisState()) {
    on<CheckDisplay>(display);
  }

  Future<FutureOr<void>> display(
      CheckDisplay event, Emitter<DisState> emit) async {
    emit(CheckingDisplay());
    WithoutLoginModel w_loginModel;

    Map data = {

    };

    w_loginModel =
    await Repository().wlogin(url: '/parish/profileview/withoutlogin', data: data);
    if (w_loginModel.status == true) {
      emit(DisplayChecked(w_loginModel: w_loginModel));
    } else {
      emit(DisplayError(error: w_loginModel.msg.toString()));
    }
  }
}
//events
class DisEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckDisplay extends DisEvent {
}


class DisState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingDisplay extends DisState {}
class DisplayChecked extends DisState {
  final WithoutLoginModel? w_loginModel;
  DisplayChecked({this.w_loginModel});
}

class DisplayError extends DisState {
  final String error;
  DisplayError({required this.error});
}
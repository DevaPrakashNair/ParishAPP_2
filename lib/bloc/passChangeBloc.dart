import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/ChangeModel.dart';
import '../data/repository.dart';


class ChangeBloc extends Bloc<ChangeEvent, ChangeState> {
  ChangeBloc() : super(ChangeState()) {

    on<CheckChange>(_checkChange);
  }



  Future<FutureOr<void>> _checkChange(
      CheckChange event, Emitter<ChangeState> emit) async {
    emit(CheckingChange());
    ChangeModel changeModel;

    Map data   = {
      "phone": event.phone,
      "password": event.password,
    };

    print(data);
    changeModel = await Repository().change(url: '/user/changePassword', data: data);
    if (changeModel.status == true) {
      emit(ChangeChecked(changeModel));
    } else {
      emit(OtpError(error: changeModel.msg.toString()));
    }
  }
}
//events
class ChangeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class CheckChange extends ChangeEvent {
  final String password, phone;
  CheckChange({required this.phone,required this.password});
}
class ShowProfile extends ChangeEvent{}


//states

class ChangeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingChange extends ChangeState {}
class ChangeChecked extends ChangeState {
  final ChangeModel changeModel;
  ChangeChecked(this.changeModel);
}

class OtpError extends ChangeState {
  final String error;
  OtpError({required this.error});
}


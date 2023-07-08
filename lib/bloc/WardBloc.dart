import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/WardModel.dart';
import '../data/repository.dart';

class WardBloc extends Bloc<WardEvent, WardState> {
  WardBloc() : super(WardState()) {
    on<CheckWard>(_CheckWard);
  }



  Future<FutureOr<void>> _CheckWard(
      CheckWard event, Emitter<WardState> emit) async {
    emit(CheckingWard());
    WardModel ward;
    ward = await Repository().ward(url: '/ward/id');
    if (ward.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(AllChecked(ward));
    } else {
      emit(AllError(error: ward.msg.toString()));
    }
  }
}
//events
class WardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckWard extends WardEvent {

}



//states

class WardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingWard extends WardState {}
class AllChecked extends WardState {
  final WardModel? ward;
  AllChecked(this.ward);
}

class AllError extends WardState {
  final String error;
  AllError({required this.error});
}
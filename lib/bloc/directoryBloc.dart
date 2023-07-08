import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/DirectoryModel.dart';
import '../data/repository.dart';


class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {
  DirectoryBloc() : super(DirectoryState()) {

    on<CheckDirectory>(_directoryEdit);
  }



  Future<FutureOr<void>> _directoryEdit(
      CheckDirectory event, Emitter<DirectoryState> emit) async {
    emit(CheckingDirectory());
    DirectoryModel directoryModel;

    Map data = {
      "wardId":event.wardId,
    };
    directoryModel = await Repository().directory(url: '/user/directory', data: data);
    if (directoryModel.status == true) {
      emit(DirectoryChecked(directoryModel));
    } else {
      emit(DirectoryError(error: directoryModel.msg.toString()));
    }
  }
}
//events
class DirectoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckDirectory extends DirectoryEvent {
  final String  wardId;
  CheckDirectory({required this.wardId});
}
class ShowProfile extends DirectoryEvent{}


//states

class DirectoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingDirectory extends DirectoryState {}
class DirectoryChecked extends DirectoryState {
  final DirectoryModel directoryModel;
  DirectoryChecked(this.directoryModel);
}

class DirectoryError extends DirectoryState {
  final String error;
  DirectoryError({required this.error});
}
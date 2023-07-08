import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/EditModel.dart';
import '../data/repository.dart';


class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditState()) {

    on<CheckEdit>(_checkEdit);
  }



  Future<FutureOr<void>> _checkEdit(
      CheckEdit event, Emitter<EditState> emit) async {
    emit(CheckingEdit());
    EditModel editModel;

    Map data = {
      "name": event.name,
      "id":event.id,
      "dob":event.dob,
      "baptismName":event.baptismName,
      "emailId":event.emailId,
      "gender":event.gender,
      "occupation":event.occupation
    };
    editModel = await Repository().edit(url: '/user/edit', data: data);
    if (editModel.status == true) {
      emit(EditChecked(editModel));
    } else {
      emit(EditError(error: editModel.msg.toString()));
    }
  }
}
//events
class EditEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckEdit extends EditEvent {
  final String  id,name,dob,baptismName,emailId,gender,occupation;
  CheckEdit({required this.name,required this.gender,required this.emailId,
    required this.baptismName,required this.id,required this.dob,required this.occupation
  });
}
class ShowProfile extends EditEvent{}


//states

class EditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingEdit extends EditState {}
class EditChecked extends EditState {
  final EditModel editModel;
  EditChecked(this.editModel);
}

class EditError extends EditState {
  final String error;
  EditError({required this.error});
}
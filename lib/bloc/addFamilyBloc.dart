import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/AddMember.dart';
import '../data/repository.dart';


class AddFamilyBloc extends Bloc<AddFamilyEvent, AddFamilyState> {
  AddFamilyBloc() : super(AddFamilyState()) {

    on<CheckAddFamily>(_CheckAddFamily);
  }



  Future<FutureOr<void>> _CheckAddFamily(
      CheckAddFamily event, Emitter<AddFamilyState> emit) async {
    emit(CheckingAddFamily());
    AddMember addFamilyModel;

    Map data = {
      "name": event.name,
      "phoneNumber":event.phone,
      "dob":event.dob,
      "baptismName":event.baptismName,
      "emailId":event.emailId,
      "gender":event.gender,
      "occupation":event.occupation
    };
    addFamilyModel = await Repository().addfamily(url: '/user/add/members', data: data);
    if (addFamilyModel.status == true) {
      emit(AddFamilyChecked(addFamilyModel));
    } else {
      emit(AddFamilyError(error: addFamilyModel.msg.toString()));
    }
  }
}
//events
class AddFamilyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckAddFamily extends AddFamilyEvent {
  final String  phone,name,dob,baptismName,emailId,gender,occupation;
  CheckAddFamily({required this.name,required this.gender,required this.emailId,
    required this.baptismName,required this.dob,required this.occupation,required this.phone
  });
}
class ShowProfile extends AddFamilyEvent{}


//states

class AddFamilyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAddFamily extends AddFamilyState {}
class AddFamilyChecked extends AddFamilyState {
  final AddMember addFamilyModel;
  AddFamilyChecked(this.addFamilyModel);
}

class AddFamilyError extends AddFamilyState {
  final String error;
  AddFamilyError({required this.error});
}
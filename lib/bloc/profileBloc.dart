import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/ProfileModel.dart';
import '../data/repository.dart';




class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<CheckProfile>(display);
  }

  Future<FutureOr<void>> display(
      CheckProfile event, Emitter<ProfileState> emit) async {
    emit(CheckingDisplay());
    ProfileModel profileModel;
    Set data = {

    };

    profileModel =
    await Repository().profile(url: '/user/profile/v1', data: data);
    if (profileModel.status == true) {
      emit(ProfileChecked(profileModel: profileModel));
    } else {
      emit(ProfileError(error: profileModel.msg.toString()));
    }
  }
}
//events
class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckProfile extends ProfileEvent {

}


class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingDisplay extends ProfileState {}
class ProfileChecked extends ProfileState {
  final ProfileModel? profileModel;
  ProfileChecked({this.profileModel});
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError({required this.error});
}
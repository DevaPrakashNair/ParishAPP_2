import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/data/model/AllUserModel.dart';

import '../data/repository.dart';

class AllUserBloc extends Bloc<AllEven, AllState> {
  AllUserBloc() : super(AllState()) {
    on<CheckUser>(_CheckUser);
  }



  Future<FutureOr<void>> _CheckUser(
      CheckUser event, Emitter<AllState> emit) async {
    emit(CheckingAll());
    AllUserModel allUserModel;
    allUserModel = await Repository().all(url: '/user/viewsalllprofile');
    if (allUserModel.status == true) {
      // await TempStorage.addToken(allUserModel.token.toString());
      // print(allUserModel.token.toString());
      emit(AllChecked(allUserModel));
    } else {
      emit(AllError(error: allUserModel.msg.toString()));
    }
  }
}
//events
class AllEven extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckUser extends AllEven {

}



//states

class AllState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAll extends AllState {}
class AllChecked extends AllState {
  final AllUserModel? allUserModel;
  AllChecked(this.allUserModel);
}

class AllError extends AllState {
  final String error;
  AllError({required this.error});
}
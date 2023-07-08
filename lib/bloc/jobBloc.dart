import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/JobModel.dart';
import '../data/repository.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(JobState()) {
    on<CheckJob>(_checkJob);
  }



  Future<FutureOr<void>> _checkJob(
      CheckJob event, Emitter<JobState> emit) async {
    emit(CheckingJob());
    JobModel jobModel;
    jobModel = await Repository().job(url: '/get/all/jobs');
    if (jobModel.status == true) {
      // await TempStorage.addToken(jobModel.token.toString());
      // print(jobModel.token.toString());
      emit(JobChecked(jobModel));
    } else {
      emit(JobError(error: jobModel.msg.toString()));
    }
  }
}
//events
class JobEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckJob extends JobEvent {

}



//states

class JobState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingJob extends JobState {}
class JobChecked extends JobState {
  final JobModel? jobModel;
  JobChecked(this.jobModel);
}

class JobError extends JobState {
  final String error;
  JobError({required this.error});
}
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parish_app/data/model/NewsModel.dart';

import '../data/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState()) {
    on<CheckNews>(_CheckNews);
  }



  Future<FutureOr<void>> _CheckNews(
      CheckNews event, Emitter<NewsState> emit) async {
    emit(CheckingJob());
    NewsModel newsModel;
    newsModel = await Repository().news(url: '/parish/viewnews');
    if (newsModel.status == true) {
      // await TempStorage.addToken(newsModel.token.toString());
      // print(newsModel.token.toString());
      emit(NewsChecked(newsModel));
    } else {
      emit(NewsError(error: newsModel.msg.toString()));
    }
  }
}
//events
class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckNews extends NewsEvent {

}



//states

class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingJob extends NewsState {}
class NewsChecked extends NewsState {
  final NewsModel? newsModel;
  NewsChecked(this.newsModel);
}

class NewsError extends NewsState {
  final String error;
  NewsError({required this.error});
}
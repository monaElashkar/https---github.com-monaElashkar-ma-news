import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/featurs/home/model/artical_model.dart';
import 'package:news_app/featurs/home/model/source_model.dart';
import '../../data/source_remote.dart';
import 'home_sate.dart';

class HomeCubit extends Cubit<HomeState> {
  SourceRemote sourceRemote = SourceRemote();
  HomeCubit() : super(HomeInitialState());
  SourceModel? sourceModel;
  String errorMessageSources = '';
  String errorMessageArticles = '';
  ArticlesModel? articlesModel;
  bool isLoudingSources = false;
  bool isLoudingArticles = false;
  getSources({required String category}) async {
    isLoudingSources = true;
    emit(SourceLoudingState(isLouding: true));
    var result = await sourceRemote.getSources(category: category);
    result.fold(
      (response) {
        if (response.statusCode == 200) {
          response.body;
          var responseBody = json.decode(response.body);
          print(responseBody['sources']);
          emit(SourceLoudingState(isLouding: false));
          sourceModel =
              SourceModel.fromJson(responseBody as Map<String, dynamic>);
          emit(SourceSuccessState(
              sourceModel:
                  SourceModel.fromJson(responseBody as Map<String, dynamic>)));
        } else {
          emit(SourceLoudingState(isLouding: false));
          errorMessageSources = 'Error';
          emit(SourceFailerState(errorMessage: 'Error'));
        }
      },
      (error) {
        errorMessageSources=error;
        emit(SourceFailerState(errorMessage: error));
      },
    );
    isLoudingSources=false;
    // Response response = await sourceRemote.getSources(category: category);
    // if (response.statusCode == 200) {
    //   response.body;
    //   var responseBody = json.decode(response.body);
    //   print(responseBody['sources']);
    //   emit(SourceLoudingState(isLouding: false));
    //   sourceModel=SourceModel.fromJson(responseBody as Map<String, dynamic>);
    //   emit(SourceSuccessState(
    //       sourceModel:
    //           SourceModel.fromJson(responseBody as Map<String, dynamic>)));
    // } else {
    //   emit(SourceLoudingState(isLouding: false));
    //   emit(SourceFailerState(errorMessage: 'Error'));
    // }
  }

  getArticles({required String sourceId}) async {
    isLoudingArticles=true;
    emit(ArticlesLoudingState(isLouding: true));
    Response response = await sourceRemote.getArticles(sourceId: sourceId);
    if (response.statusCode == 200) {
      response.body;

      emit(ArticlesLoudingState(isLouding: false));
      var responseBody = json.decode(response.body);
      print(" articles ${responseBody['articles']}");
      articlesModel = ArticlesModel.fromJson(responseBody);
      emit(ArticlesSuccessState(
          articlesModel: ArticlesModel.fromJson(responseBody)));
    } else {
      emit(ArticlesLoudingState(isLouding: false));
      errorMessageArticles = 'Error';
      emit(ArticlesFailerState(errorMessage: 'Error'));
    }
    isLoudingArticles=false;
  }
}

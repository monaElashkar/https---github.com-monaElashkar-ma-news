import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/featurs/home/model/artical_model.dart';
import 'package:news_app/featurs/home/model/source_model.dart';
import '../../data/source_remote.dart';
import 'home_sate.dart';

class HomeCubit extends Cubit<HomeState> {
  SourceRemote sourceRemote = SourceRemote();
  HomeCubit() : super(HomeInitialState());

  getSources({required String category}) async {
    emit(SourceLoudingState(isLouding: true));
    Response response = await sourceRemote.getSources(category: category);
    if (response.statusCode == 200) {
      response.body;
      emit(SourceLoudingState(isLouding: false));
      emit(SourceSuccessState(
          sourceModel:
              SourceModel.fromJson(response.body as Map<String, dynamic>)));
    } else {
      emit(SourceLoudingState(isLouding: false));
      emit(SourceFailerState(errorMessage: 'Error'));
    }
  }

    getArticles({required String sourceId}) async {
    emit(ArticlesLoudingState(isLouding: true));
    Response response = await sourceRemote.getArticles(sourceId: sourceId);
    if (response.statusCode == 200) {
      response.body;
      emit(ArticlesLoudingState(isLouding: false));
      emit(ArticlesSuccessState(
          articlesModel:
              ArticlesModel.fromJson(response.body as Map<String, dynamic>)));
    } else {
      emit(ArticlesLoudingState(isLouding: false));
      emit(ArticlesFailerState(errorMessage: 'Error'));
    }
  }
}

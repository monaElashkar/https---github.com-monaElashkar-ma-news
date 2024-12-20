import 'package:news_app/featurs/home/model/artical_model.dart';
import 'package:news_app/featurs/home/model/source_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}
class SourceLoudingState extends HomeState {
  bool isLouding;
  SourceLoudingState({required this.isLouding});
}
class SourceSuccessState extends HomeState {
  SourceModel sourceModel;
  SourceSuccessState({required this.sourceModel});
}
class SourceFailerState extends HomeState {
  String errorMessage;
  SourceFailerState({required this.errorMessage});
}


class ArticlesLoudingState extends HomeState {
  bool isLouding;
  ArticlesLoudingState({required this.isLouding});
}
class ArticlesSuccessState extends HomeState {
  ArticlesModel articlesModel;
  ArticlesSuccessState({required this.articlesModel});
}
class ArticlesFailerState extends HomeState {
  String errorMessage;
  ArticlesFailerState({required this.errorMessage});
}
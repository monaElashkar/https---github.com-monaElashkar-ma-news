import 'package:flutter/material.dart';
import 'package:news_app/featurs/home/presentation/screens/home_screen.dart';
import '../../featurs/categories/presentation/screrns/categories_screen.dart';

class RouteKeys{
  static const String categoriesScreen = "/categoriesScreen";
  static const String homeScreen = "/HomeScreen";
}

class Routes {
 static Map<String, Widget Function(BuildContext)> route={
  RouteKeys.categoriesScreen: (context) => const CategoriesScreen(),
  RouteKeys.homeScreen: (context) =>  HomeScreen(),
 };
}
import 'package:flutter/material.dart';
import 'package:news_app/core/route/route_keys.dart';
import 'package:news_app/core/theme/style.dart';
import 'package:news_app/featurs/categories/model/category_model.dart';

class CustomCategoriesList extends StatelessWidget {
  CustomCategoriesList({Key? key}) : super(key: key);
  //businessentertainmentgeneralhealthsciencesportstechnology
  final List<CategoryModel> categories = [
    CategoryModel(
        name: 'business',
        image: 'assets/images/category1.png',
        key: "business"),
    CategoryModel(
        name: 'entertainment',
        image: 'assets/images/category1.png',
        key: "entertainment"),
    CategoryModel(
        name: 'health', image: 'assets/images/category1.png', key: "health"),
    CategoryModel(
        name: 'science', image: 'assets/images/category1.png', key: "science"),
    CategoryModel(
        name: 'sports', image: 'assets/images/category1.png', key: "sports"),
    CategoryModel(
        name: 'technology',
        image: 'assets/images/category1.png',
        key: "technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 21,
          mainAxisSpacing: 14,
          childAspectRatio: 3 / 2,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteKeys.homeScreen,
              arguments:categories[index].key );
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(categories[index].image),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                categories[index].name,
                style: AppTextStyle.size16SimBoldWhiteColor,
              ),
            ),
          );
        });
  }
}

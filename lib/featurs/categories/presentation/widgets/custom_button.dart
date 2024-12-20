import 'package:flutter/cupertino.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/core/theme/style.dart';

import '../../../../core/route/route_keys.dart';
import '../../model/category_model.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key}) : super(key: key);
  final CategoryModel all =
      CategoryModel(name: 'View All', image: '', key: "general");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteKeys.homeScreen, arguments: all.key);
      },
      child: Container(
        height: 33,
        width: 194,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColor.blackTextColor,
        ),
        child: Text(
          all.name,
          style: AppTextStyle.size10BoldWhiteColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_categories_list.dart';
import '../widgets/custom_title.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 76,),
            const CustomTitle(),
            const SizedBox(height: 39,),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomCategoriesList(),
              ),
            ),
            CustomButton(),
            const Spacer(flex: 1,),
          ],
        ),
      ),
     );
  }
}
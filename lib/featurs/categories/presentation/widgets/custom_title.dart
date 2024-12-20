import 'package:flutter/cupertino.dart';

import '../../../../core/theme/style.dart';

class CustomTitle extends StatelessWidget {
 const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          'Pick your interests',
          style: AppTextStyle.size22boldBlackTextColor,
        ),
        const SizedBox(
          height: 15,
        ),
         Text(
          'We’ll use this info to personalize your\nfeed to recommend things you’ll like.',
          style: AppTextStyle.size12MediumBlackTextColor,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../const/data.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../login/presentation/views/login_view.dart';

class OnBoardingViewBodyCard extends StatelessWidget {
  final String image;
  final String title;

  final String body;

  final PageController controller;
  final int numbers;

  final bool isLast;

  final void Function()? onPressed;
  const OnBoardingViewBodyCard(
      {super.key,
        required this.image,
        required this.title,
        required this.controller,
        required this.numbers,
        this.onPressed,
        required this.isLast, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(image),
        ),
        Padding(
          padding: const EdgeInsets.all( 16),
          child: Text(
            title,
            style: Styles.textStyle800.copyWith(fontSize: 18.sp),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            body,
            style: Styles.textStyle400.copyWith(fontSize: 14.sp,color: Colors.black45),
            textAlign: TextAlign.center,
            maxLines: 4,

          ),
        ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                SmoothPageIndicator(
                  controller: controller,
                  count: numbers,
                  effect: ExpandingDotsEffect(
                    activeDotColor: kDefaultColor,
                    dotColor: Colors.blueGrey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  mini: false,
                  onPressed: () {
                    if (isLast) {
                      NavigatorMethods.pushReplacement(context: context, nextPage: LoginView());
                    }
                    else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    }
                  },
                  backgroundColor: kDefaultColor,
                  child: isLast
                      ? Icon(Icons.login,color: Colors.white,)
                      : Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const/data.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../login/presentation/views/login_view.dart';
import 'on_boarding_view_body_card.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  var controller = PageController();
  var isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              NavigatorMethods.pushReplacement(context: context, nextPage: LoginView());
            },
            child: Text(
              'Skip',
              style: Styles.textStyle500.copyWith(fontSize: 18.sp,color: kDefaultColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onBoardings.length,
              onPageChanged: (value) {
                if (value == onBoardings.length-1) {
                  log('isLast = $isLast');
                  setState(() {
                    isLast = true;
                  });
                } else {
                  isLast = false;
                  log('isLast = $isLast');
                  setState(() {

                  });

                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => OnBoardingViewBodyCard(
                image: onBoardings[index].image,
                title: onBoardings[index].title,
                body: onBoardings[index].body,
                controller: controller,
                numbers: onBoardings.length,
                isLast: isLast,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


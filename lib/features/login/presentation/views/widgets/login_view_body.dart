import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const/data.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../sign_in_view.dart';
import '../sign_up_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/ShopIcon.png'),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Start You Shopping Journey Now ',
                        style: Styles.textStyle800.copyWith(fontSize: 20.sp),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Stay updated with the latest trends and offers by subscribing to our newsletter',
                          style: Styles.textStyle400
                              .copyWith(fontSize: 14.sp, color: Colors.black45),
                          textAlign: TextAlign.center,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        width: double.infinity,
                        onPressed: () {
                          NavigatorMethods.push(context: context, nextPage: SignInView());
                        },
                        text: 'Login',
                        isBorderSameColor: false,
                        backGroundColor: Colors.transparent,
                        elevation: 0,
                        textColor: kDefaultColor,
                      ),
                      CustomButton(
                        width: double.infinity,
                        onPressed: () {
                          NavigatorMethods.push(context: context, nextPage: SignUpView());
                        },
                        text: 'Register',
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

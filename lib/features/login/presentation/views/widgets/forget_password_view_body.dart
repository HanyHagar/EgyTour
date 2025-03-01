import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';


class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register,Now ',
                  style: Styles.textStyle800.copyWith(fontSize: 25.sp),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  'Create an account so you can order you favorite products easily and quickly.',
                  style: Styles.textStyle400
                      .copyWith(fontSize: 14.sp, color: Colors.black45),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
                SizedBox(height: 16,),
                CustomTextFormField(
                  isHiddenInputBorder: true,
                  controller: TextEditingController(),
                  title: 'UserName',
                  keyboardType: TextInputType.text,
                ),
                CustomButton(onPressed: () {}, text: 'Login',isDefault: false,style: Styles.textStyle800.copyWith(fontSize: 18.sp,letterSpacing: 1),),
                SizedBox(height: 24,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

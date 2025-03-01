import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const/data.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/login_cubit.dart';
import '../sign_in_view.dart';


class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: cubit.registerFormKey,
            autovalidateMode: cubit.registerAutoValidate,
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
                    textAlign: TextAlign.start,
                    maxLines: 4,
                  ),
                  SizedBox(height: 16,),
                  CustomTextFormField(
                    isEnablePrefixIcon: false,
                    isHiddenInputBorder: true,
                    controller: cubit.registerUserName,
                    isLabelText: false,
                    title: 'User Name',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 24,),
                  CustomTextFormField(
                    isEnablePrefixIcon: false,
                    isHiddenInputBorder: true,
                    controller: cubit.registerEmail,
                    isLabelText: false,
                    title: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24,),
                  CustomTextFormField(
                    isEnablePrefixIcon: false,
                    isHiddenInputBorder: true,
                    controller: cubit.registerPhone,
                    isLabelText: false,
                    title: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 24,),
                  CustomTextFormField(
                    isHiddenInputBorder: true,
                    controller: cubit.registerPassword,
                    isEnablePrefixIcon: false,
                    isLabelText: false,
                    title: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    isObscureText: cubit.registerTextObscure,
                    isEnableSuffixIcon: true,
                    suffixIcon: cubit.registerTextObscure
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    suffixIconOnPressed: cubit.changeRegisterTextObscure,
                  ),
                  SizedBox(height: 32,),
                  CustomButton(onPressed: cubit.registerOnPressed, text: 'Register',isDefault: false,style: Styles.textStyle800.copyWith(fontSize: 18.sp,letterSpacing: 1),),
                  SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have An Account? ',
                        style: Styles.textStyle800.copyWith(fontSize: 16.sp, color: Colors.black45),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          NavigatorMethods.push(context: context, nextPage: SignInView());
                        },
                        child: Text(
                          'Login ',
                          style: Styles.textStyle500.copyWith(fontSize: 16.sp,color: kDefaultColor),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

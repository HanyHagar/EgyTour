import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const/data.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/login_cubit.dart';
import '../forget_password_view.dart';
import '../sign_up_view.dart' show SignUpView;
class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.signInFormKey,
                    autovalidateMode: cubit.autoValidate,
                    child: Column(
                      children: [
                        _buildHeaderText('Welcome Back!', 25.sp),
                        _buildHeaderText('Sign in to your account.', 14.sp, color: Colors.black45),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          isHiddenInputBorder: true,
                          controller: cubit.loginEmail,
                          isLabelText: false,
                          title: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          isEnablePrefixIcon: false,
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          isHiddenInputBorder: true,
                          controller: cubit.loginPassword,
                          isEnablePrefixIcon: false,
                          isLabelText: false,
                          title: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          isObscureText: cubit.signInTextObscure,
                          isEnableSuffixIcon: true,
                          suffixIcon: cubit.signInTextObscure
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          suffixIconOnPressed: cubit.changeSignInTextObscure,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => NavigatorMethods.push(
                              context: context,
                              nextPage: const ForgetPasswordView(),
                            ),
                            child: _buildHeaderText('Forget Password?', 14.sp, color: Colors.black45),
                          ),
                        ),
                        CustomButton(
                          onPressed: cubit.signInOnPressed,
                          text: 'Login',
                          isDefault: false,
                          style: Styles.textStyle800.copyWith(fontSize: 18.sp, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildHeaderText('Not A Member? ', 16.sp, color: Colors.black45),
                            TextButton(
                              onPressed: () => NavigatorMethods.push(
                                context: context,
                                nextPage: const SignUpView(),
                              ),
                              child: _buildHeaderText('Join Now', 16.sp, color: kDefaultColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderText(String text, double fontSize, {Color color = Colors.black}) {
    return Text(
      text,
      style: Styles.textStyle800.copyWith(fontSize: fontSize, color: color),
      textAlign: TextAlign.center,
    );
  }
}

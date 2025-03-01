import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../manager/login_cubit.dart';
import 'widgets/sign_in_view_body.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.loginData.message.toString(),maxLines: 2,style: Styles.textStyle700.copyWith(color: Colors.white,fontSize: 16.sp),),
              backgroundColor: CupertinoColors.activeGreen,
            ),
          );
          // NavigatorMethods.pushReplacement(context: context, nextPage: ShopView());
          // ShopCubit.get(context).loginModel = state.loginData;
          // ShopCubit.get(context).fetchHomeModel(token: state.loginData.data.token);
        }
        if (state is LoginFailure) {
          log(state.error.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString(),maxLines: 2,style: Styles.textStyle700.copyWith(color: Colors.white,fontSize: 16.sp),),
              backgroundColor: CupertinoColors.destructiveRed,
            ),
          );
        }
        if (state is LoginWarning) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.create(
              title: 'Warning',
              message: state.loginData.message.toString(),
              type: ContentType.warning,
            ),
          );
        }
      },
      builder: (context, state) {
          return SignInViewBody();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../manager/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is AutoLoginSuccess){
          // ShopCubit.get(context).fetchHomeModel(token: state.loginData.data.token);
          // NavigatorMethods.pushReplacement(context: context,nextPage: ShopView());
        }
        if(state is FetchHiveLoginDataSuccess){

        }
      },
      builder: (context, state) {
          return LoginViewBody();
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/presentation/manager/login_cubit.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../utils/navigator_methods.dart';



class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is AutoLoginFailure){
          NavigatorMethods.pushReplacement(context: context, nextPage: LoginView());
        }
        if(state is AutoLoginSuccess){

          NavigatorMethods.pushReplacement(context: context, nextPage: LoadingView());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(
              color: CupertinoColors.systemGreen,),
          ),
        );
      },
    );
  }
}

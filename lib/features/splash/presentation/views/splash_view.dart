import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../../../onBoarding/presentation/views/on_boarding_view.dart';
import '../../data/repo/splash_repo.dart';
import '../../data/repo/splash_repo_impl.dart';
import '../manager/splash_view_cubit/splash_cubit.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = SplashRepoImpl();
    return BlocProvider(
      create: (context) => SplashCubit(repo as SplashRepo)..getLocation(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is GetLocationFailure) {
            log(state.error.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.create(
                title: 'Unable to Access Location Data',
                message: state.error.toString(),
                type: ContentType.warning,
              ),
            );
          }
          if (state is AddHiveLocationSuccess){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            NavigatorMethods.pushReplacement(context: context, nextPage: OnBoardingView());
          }
          if (state is UpdateHiveLocationSuccess){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            // LoginCubit.get(context).autoSignIn();
            // NavigatorMethods.pushReplacement(context: context, nextPage:LoadingView());
          }
          if (state is GetHiveLocationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.create(
                title: 'Access Location Data',
                message: state.locationModel.city.city.toString(),
                type: ContentType.success,
              ),
            );
          }
        },
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body:SplashViewBody(),
          );
        },
      ),
    );
  }
}

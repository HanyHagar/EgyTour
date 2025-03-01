import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/api_services.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/login/data/models/data_model.dart';
import 'features/login/data/models/login_model.dart';
import 'features/login/data/repo/login_repo_impl.dart';
import 'features/login/presentation/manager/login_cubit.dart';
import 'features/splash/data/models/city_model.dart';
import 'features/splash/data/models/location_model.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register Adapters
  Hive.registerAdapter(LocationModelAdapter());
  Hive.registerAdapter(CityModelAdapter());
  Hive.registerAdapter(LoginModelAdapter());
  Hive.registerAdapter(DataModelAdapter());
  ApiServices.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // Set status bar color to black
    statusBarIconBrightness: Brightness.light, // White icons
    systemNavigationBarColor: Colors.black, // Optional: Black navigation bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(providers: [
          BlocProvider(create: (context) => LoginCubit(LoginRepoImpl())),

        ],
           child: BlocConsumer<LoginCubit, LoginState>(
          // child: BlocConsumer<ShopCubit, ShopState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: AppBarTheme(
                        color: Colors.white,
                        elevation: 0,
                        scrolledUnderElevation: 0,
                      ),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          backgroundColor: Colors.white,
                          selectedItemColor: CupertinoColors.systemGreen,
                          elevation: 0,
                          type: BottomNavigationBarType.fixed
                      )
                  ),
                  home: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SplashView(),),
                );
              },
            )
        );
      },
    );
  }
}



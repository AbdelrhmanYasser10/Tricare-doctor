import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/home_layout/screens/home_layout.dart';
import 'package:tricares_doctor_app/features/sessions/cubits/sessions_cubit/sessions_cubit.dart';
import 'core/Global Cubit/global_cubit.dart';
import 'core/globle/theme/dark_theme.dart';
import 'core/globle/theme/light_theme.dart';
import 'core/network/Local/CashHelper.dart';
import 'features/Authentication/cubit/auth_cubit.dart';
import 'features/Introduction/On Boarding Screen/onboarding_screen.dart';
import 'features/home_layout/cubits/app_cubit/app_cubit.dart';
import 'features/profile/cubit/profile_cubit.dart';
import 'features/profits/cubits/paginator_cubit/paginator_cubit.dart';
import 'features/profits/cubits/profits_cubit/profits_cubit.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.initialize();
  print(
      CashHelper.prefs.get("token")
  );
  DioHelper.initialize(EndPoints.baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>GlobalCubit()),
        BlocProvider(create: (context)=>AppCubit()),
        BlocProvider(create: (context)=>SessionsCubit()),
        BlocProvider(
            create: (context) => AuthCubit()),
        BlocProvider(create: (context) => GlobalCubit()),
        BlocProvider(create: (context) => ProfileCubit()..postUserData()),
        BlocProvider(create: (context) => PaginatorCubit()),

        BlocProvider(
            create: (context) => AuthCubit()),
      ],
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'TriCare Doctors',
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            themeMode: context.read<GlobalCubit>().isLight? ThemeMode.light: ThemeMode.dark,
            home: CashHelper.prefs.getBool('login') == null ? OnBoardingScreen() :HomeLayoutScreen(),
          );
        },
      ),
    );
  }
}


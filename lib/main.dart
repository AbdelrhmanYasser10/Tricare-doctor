import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/network/Remote/DioHelper.dart';
import 'package:tricares_doctor_app/core/network/endPoind.dart';
import 'package:tricares_doctor_app/features/Drawer/cubit/drawer_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/home/cubits/home_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/add_profit_cubit/add_profit_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/profits_cubit/profits_cubit.dart';
import 'package:tricares_doctor_app/features/sessions/cubits/sessions_cubit/sessions_cubit.dart';
import 'core/Global Cubit/global_cubit.dart';
import 'core/Notification/cubit/notification_cubit.dart';
import 'core/Notification/screens/notification.dart';
import 'core/globle/theme/dark_theme.dart';
import 'core/globle/theme/light_theme.dart';
import 'core/network/Firebase/notification.dart';
import 'core/network/Local/CashHelper.dart';
import 'features/Authentication/cubit/auth_cubit.dart';
import 'features/appointments/cubits/appointment_details_cubit/appointment_details_cubit.dart';
import 'features/home_layout/cubits/app_cubit/app_cubit.dart';
import 'features/home_layout/screens/splash_screen.dart';
import 'features/profile/cubit/profile_cubit.dart';
import 'features/profits/cubits/paginator_cubit/paginator_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

final navigationKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await CashHelper.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    print(CashHelper.prefs.get("token"));
  }
  DioHelper.initialize(EndPoints.baseUrl);
  await FirebaseNotification().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GlobalCubit()),
        BlocProvider(create: (context) => AppCubit()..getHomeData()),
        BlocProvider(create: (context) => SessionsCubit()),
        BlocProvider(create: (context) => AppointementCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => GlobalCubit()),
        BlocProvider(create: (context) => ProfileCubit()..postUserData()),
        BlocProvider(create: (context) => DrawerCubit()),
        BlocProvider(create: (context) => HomeCubit()..getTabs()),
        BlocProvider(
          create: (context) => NotificationCubit()..getNotification(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AppointmentDetailsCubit()),
        BlocProvider(create: (context) => AppointementCubit()),
        BlocProvider(create: (context) => ProfitsCubit()),
        BlocProvider(create: (context) => AddProfitCubit()),
      ],
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          var cubit = context.read<GlobalCubit>();

          return MaterialApp(
            locale: Locale(cubit.local),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'TriCare Partners',
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            themeMode: context.read<GlobalCubit>().isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const SplashScreen(),
            navigatorKey: navigationKey,
            routes: {
              '/notification': (context) => const NotificationScreen(),
            },
          );
        },
      ),
    );
  }
}

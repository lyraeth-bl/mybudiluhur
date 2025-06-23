import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/budi_luhur_app_entry.dart';
import 'package:mybudiluhur/features/auth/data/api_auth_repository.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/data/api_ekstrakulikuler_user_repository.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_cubit.dart';
import 'package:mybudiluhur/features/home/data/api_home_user_repository.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/date_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/days_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/greetings_cubit.dart';
import 'package:mybudiluhur/features/notification/presentation/pages/notification_page.dart';
import 'package:mybudiluhur/features/profile/data/api_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/data/local_detail_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/detail_profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/password_check_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/profile_picture_cubit.dart';
import 'package:mybudiluhur/features/settings/data/local_settings_user_repository.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class BudiLuhurApp extends StatefulWidget {
  const BudiLuhurApp({super.key});

  @override
  State<BudiLuhurApp> createState() => _BudiLuhurAppState();
}

class _BudiLuhurAppState extends State<BudiLuhurApp> {
  // Repository
  final apiAuthRepository = ApiAuthRepository();
  final apiHomeUserRepository = ApiHomeUserRepository();
  final apiProfileUserRepository = ApiProfileUserRepository();
  final apiEkstrakulikulerUserRepository = ApiEkstrakulikulerUserRepository();
  final localDetailProfileUserRepository = LocalDetailProfileUserRepository();
  final localSettingsUserRepository = LocalSettingsUserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth Cubit Providers
        BlocProvider(
          create: (context) =>
              AuthCubit(apiAuthRepository: apiAuthRepository)..checkAuth(),
        ),

        // Bottom Menu Bloc Providers
        BlocProvider(create: (context) => BottomMenuBloc()),

        // Greetings Cubit Providers
        BlocProvider(create: (context) => GreetingsCubit()),

        // Days Cubit Providers
        BlocProvider(create: (context) => DaysCubit()),

        // getDate Cubit Providers
        BlocProvider(create: (context) => DateCubit()),

        // HomeUser Cubit Providers
        BlocProvider(
          create: (context) =>
              HomeCubit(apiHomeUserRepository: apiHomeUserRepository),
        ),

        // Profile Cubit Providers
        BlocProvider(
          create: (context) =>
              ProfileCubit(apiProfileUserRepository: apiProfileUserRepository),
        ),

        // Profile Picture Cubit Providers
        BlocProvider(create: (context) => ProfilePictureCubit()),

        // Password Check Cubit Providers
        BlocProvider(
          create: (context) => PasswordCheckCubit(
            apiProfileUserRepository: apiProfileUserRepository,
          ),
        ),

        // Detail Profile Cubit Providers
        BlocProvider(
          create: (context) => DetailProfileCubit(
            localDetailProfileUserRepository: localDetailProfileUserRepository,
          ),
        ),

        // Ekstrakulikuler Cubit Providers
        BlocProvider(
          create: (context) => EkstrakulikulerCubit(
            apiEkstrakulikulerUserRepository: apiEkstrakulikulerUserRepository,
          ),
        ),

        // Settings Cubit Providers
        BlocProvider(
          create: (context) => SettingsCubit(
            localSettingsUserRepository: localSettingsUserRepository,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
        ),
        title: "MyBudiLuhur",
        theme: ThemeData(fontFamily: "Sniglet"),
        home: const BudiLuhurAppEntry(),
        navigatorKey: navigatorKey,
        routes: {'/notification_page': (context) => const NotificationPage()},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/budi_luhur_app_entry.dart';
import 'package:mybudiluhur/features/auth/data/api_auth_repository.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/home/data/api_home_user_repository.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/date_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/days_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/greetings_cubit.dart';
import 'package:mybudiluhur/features/profile/data/api_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/password_check_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/profile_picture_cubit.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyBudiLuhur",
        theme: ThemeData(fontFamily: "Sniglet"),
        home: const BudiLuhurAppEntry(),
      ),
    );
  }
}

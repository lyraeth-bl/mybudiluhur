import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/budi_luhur_app_entry.dart';
import 'package:mybudiluhur/features/auth/data/api_auth_repository.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';

class BudiLuhurApp extends StatefulWidget {
  const BudiLuhurApp({super.key});

  @override
  State<BudiLuhurApp> createState() => _BudiLuhurAppState();
}

class _BudiLuhurAppState extends State<BudiLuhurApp> {
  // Repository
  final apiAuthRepository = ApiAuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth Cubit Providers
        BlocProvider(
          create: (context) =>
              AuthCubit(apiAuthRepository: apiAuthRepository)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        title: "MyBudiLuhur",
        theme: ThemeData(fontFamily: "Sniglet"),
        home: const BudiLuhurAppEntry(),
      ),
    );
  }
}

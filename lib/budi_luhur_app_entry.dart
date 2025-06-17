import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_state.dart';
import 'package:mybudiluhur/features/auth/presentation/pages/auth_page.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_layout.dart';

class BudiLuhurAppEntry extends StatelessWidget {
  const BudiLuhurAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is Authenticated) {
          return HomeLayout();
        } else if (authState is Unauthenticated) {
          return AuthPage();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

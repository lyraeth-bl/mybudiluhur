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
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, authState) {
        // Jika user terauthentikasi
        if (authState is Authenticated) {
          return const HomeLayout();
        }
        // Jika user tidak terauthentikasi
        else if (authState is Unauthenticated) {
          return const AuthPage();
        }
        // Loading...
        else {
          return const Scaffold(
            backgroundColor: Color(0xFFF5F7FA),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Loading..."),
                ],
              ),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
    );
  }
}

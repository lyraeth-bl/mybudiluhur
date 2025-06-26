import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
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
          return MyLoadingScreen(text: "Loading...");
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return MyCupertinoAlertDialog(text: state.message);
            },
          );
        }
      },
    );
  }
}

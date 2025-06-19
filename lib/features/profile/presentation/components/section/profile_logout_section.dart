import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';

class ProfileLogoutSection extends StatelessWidget {
  const ProfileLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyContainer(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.red,
            child: GestureDetector(
              onTap: () {
                context.read<AuthCubit>().logout();
              },
              child: MyText(text: "Logout", textColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

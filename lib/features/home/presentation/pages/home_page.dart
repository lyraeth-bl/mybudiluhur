import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/components/section/greetings_section.dart';
import 'package:mybudiluhur/features/home/presentation/components/section/today_attendance_section.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/greetings_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Cubit
  late final authCubit = context.read<AuthCubit>();
  late final greetingCubit = context.read<GreetingsCubit>();
  late final homeCubit = context.read<HomeCubit>();

  // ketika page dibuka fetch data
  @override
  void initState() {
    super.initState();
    homeCubit.fetchHomeUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: MyText(
                        text: "MyBudiLuhur",
                        textColor: Colors.white,
                        bold: true,
                      ),
                      centerTitle: true,
                    ),
                    backgroundColor: Colors.lightBlue[400],
                    foregroundColor: Colors.white,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10)),

                  // Greetings Section
                  SliverToBoxAdapter(child: GreetingsSection()),

                  SliverToBoxAdapter(child: MyDivider()),

                  // Checkin & Checkout Section
                  SliverToBoxAdapter(child: TodayAttendanceSection()),

                  SliverToBoxAdapter(child: MyDivider()),
                ],
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (context, state) {
        if (state is HomeError) {
          showAboutDialog(
            context: context,
            applicationName: "MyBudiLuhur",
            children: [Text(state.message)],
          );
        }
      },
    );
  }
}

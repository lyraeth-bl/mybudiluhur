import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/presentation/components/section/greetings_section.dart';
import 'package:mybudiluhur/features/home/presentation/components/section/today_attendance_section.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_state.dart';

class HomePage extends StatefulWidget {
  final String nis;
  const HomePage({super.key, required this.nis});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Cubit
  late final homeCubit = context.read<HomeCubit>();

  // ketika page dibuka fetch data
  @override
  void initState() {
    super.initState();
    homeCubit.fetchData();
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
                    title: MyText(text: "MyBudiLuhur", bold: true),
                    centerTitle: true,
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
          return MyLoadingScreen(
            text: "Loading your home...",
            title: "MyBudiLuhur",
          );
        }
      },
      listener: (context, state) {
        if (state is HomeError) {
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

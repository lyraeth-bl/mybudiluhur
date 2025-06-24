import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/drawer/my_drawer.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bottom_navigation_menu.dart.dart';
import 'package:mybudiluhur/features/home/presentation/components/home_floating_action_button.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_page.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/profile_page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // Cubit for get data
  late final user = context.read<AuthCubit>().currentUser;

  // Cubit
  late final homeCubit = context.read<HomeCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late final ekstrakulikulerCubit = context.read<EkstrakulikulerCubit>();

  // refresh function
  Future<void> _refresh() async {
    await homeCubit.clear();
    await profileCubit.clear();
    await ekstrakulikulerCubit.clear();
    await homeCubit.refreshData(user!.nis);
    await homeCubit.fetchData();
    await profileCubit.fetchProfileUser();
    await ekstrakulikulerCubit.refreshData(user!.nis);
  }

  int prevIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        final oldIndex = prevIndex;
        prevIndex = state.currentIndex;
        return Scaffold(
          // Body dengan refresh
          body: RefreshIndicator(
            onRefresh: _refresh,
            backgroundColor: Colors.lightBlue[400],
            color: Colors.white,
            strokeWidth: 3,
            displacement: 95,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 900),
              reverse:
                  state.currentIndex < oldIndex, // Biar arah animasi sesuai
              transitionBuilder: (child, animation, secondaryAnimation) =>
                  SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
              child: getPage(
                state.currentIndex,
                key: ValueKey(state.currentIndex),
              ),
            ),
          ),

          // Botton Menu Navigation
          bottomNavigationBar: const BottomNavigationMenu(),

          // Drawer
          drawer: MyDrawer(),

          // Icon / Tombol QR
          floatingActionButton: const HomeFloatingActionButton(),

          // Agar tombol QR Ditengah
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant HomeLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update prevIndex setiap kali ada rebuild
    prevIndex = context.read<BottomMenuBloc>().state.currentIndex;
  }

  // getPage
  Widget getPage(int index, {Key? key}) {
    late Widget page;
    switch (index) {
      case 0:
        page = HomePage(nis: user!.nis, key: key);
        break;
      case 1:
        page = SizedBox(key: key);
        break;
      case 2:
        page = SizedBox(key: key);
        break;
      case 3:
        page = ProfilePage(key: key);
        break;
      default:
        page = HomePage(nis: user!.nis, key: key);
    }
    return page;
  }
}

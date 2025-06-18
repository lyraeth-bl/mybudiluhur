import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Colors.lightBlue[400],
          showUnselectedLabels: false,
          selectedFontSize: 15,
          elevation: 5,
          unselectedItemColor: Colors.white54,
          currentIndex: state.currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: Colors.white,
          onTap: (index) {
            context.read<BottomMenuBloc>().add(BottomMenuChanged(index));
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      },
    );
  }
}

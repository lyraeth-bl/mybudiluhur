import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          elevation: 5,
          unselectedItemColor: Colors.grey,
          currentIndex: state.currentIndex,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          selectedItemColor: Colors.blueAccent,
          onTap: (index) {
            context.read<BottomMenuBloc>().add(BottomMenuChanged(index));
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bell),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}

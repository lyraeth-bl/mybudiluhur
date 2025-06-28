import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: colorScheme.surface,
            showUnselectedLabels: true,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            elevation: 0,
            unselectedItemColor: colorScheme.tertiary,
            currentIndex: state.currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: colorScheme.primary,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            onTap: (index) {
              context.read<BottomMenuBloc>().add(BottomMenuChanged(index));
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(LucideIcons.house, size: 22.r),
                ),
                activeIcon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    LucideIcons.house,
                    size: 22.r,
                    color: colorScheme.primary,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(LucideIcons.bell, size: 22.r),
                ),
                activeIcon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    LucideIcons.bell,
                    size: 22.r,
                    color: colorScheme.primary,
                  ),
                ),
                label: "Notification",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(LucideIcons.search, size: 22.r),
                ),
                activeIcon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    LucideIcons.search,
                    size: 22.r,
                    color: colorScheme.primary,
                  ),
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(LucideIcons.user, size: 22.r),
                ),
                activeIcon: Container(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    LucideIcons.user,
                    size: 22.r,
                    color: colorScheme.primary,
                  ),
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}

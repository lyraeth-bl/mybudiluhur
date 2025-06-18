import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudiluhur/components/drawer/my_drawer.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bottom_navigation_menu.dart.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // getPage
  Widget getPage(int index) {
    late final user = context.read<AuthCubit>().currentUser;
    late Widget page;
    switch (index) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const SizedBox();
        break;
      case 2:
        page = const SizedBox();
        break;
      case 3:
        page = SizedBox();
        break;
      default:
        page = const HomePage();
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data user login
    late final user = context.read<AuthCubit>().currentUser;
    // ambil nis nya untuk QR Code
    String nis = user!.nis;
    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        return Scaffold(
          // Body tiap Page
          body: getPage(state.currentIndex),

          // Botton Menu Navigation
          bottomNavigationBar: const BottomNavigationMenu(),

          // Drawer
          drawer: MyDrawer(),

          // Icon / Tombol QR
          floatingActionButton: FloatingActionButton(
            elevation: 5,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.grey[100],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          QrImageView(
                            data: nis,
                            version: QrVersions.auto,
                            size: 220.0,
                            padding: const EdgeInsets.all(12),
                          ),
                          SizedBox(height: 20),
                          MyContainer(
                            color: Colors.lightBlue[400],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },

            // Logo Botton QR
            child: FaIcon(FontAwesomeIcons.qrcode),
          ),

          // Agar tombol QR Ditengah
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
        );
      },
    );
  }
}

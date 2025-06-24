import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() =>
      _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  // Cubit for get data
  late final user = context.read<AuthCubit>().currentUser;
  @override
  Widget build(BuildContext context) {
    String nis = user!.nis;
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: Colors.lightBlue[400],
      foregroundColor: Colors.white,
      onPressed: () {
        showCupertinoSheet(
          context: context,
          pageBuilder: (BuildContext context) {
            return Container(
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
                  ],
                ),
              ),
            );
          },
        );
      },

      // Logo Botton QR
      child: FaIcon(FontAwesomeIcons.qrcode),
    );
  }
}

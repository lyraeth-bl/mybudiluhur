import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      onPressed: () {
        showCupertinoSheet(
          context: context,
          pageBuilder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15).r,
                  topRight: Radius.circular(15).r,
                ),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QrImageView(
                      data: nis,
                      version: QrVersions.auto,
                      size: 250.0.r,
                      padding: const EdgeInsets.all(12).r,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },

      // Logo Botton QR
      child: Icon(LucideIcons.qrCode),
    );
  }
}

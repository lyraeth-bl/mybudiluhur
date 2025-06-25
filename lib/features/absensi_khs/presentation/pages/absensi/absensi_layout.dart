import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_layout.dart';
import 'package:mybudiluhur/components/my_null_data_page.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/cubit/absensi_cubit.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/cubit/absensi_state.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/pages/absensi/absensi_page.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';

class AbsensiLayout extends StatefulWidget {
  const AbsensiLayout({super.key});

  @override
  State<AbsensiLayout> createState() => _AbsensiLayoutState();
}

class _AbsensiLayoutState extends State<AbsensiLayout> {
  // Cubit
  late final authUser = context.read<AuthCubit>().currentUser;
  late final absensiCubit = context.read<AbsensiCubit>();

  @override
  void initState() {
    super.initState();
    absensiCubit.fetchData(authUser!.nis);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsensiCubit, AbsensiState>(
      builder: (context, state) {
        if (state is AbsensiLoaded) {
          final absensi = state.absensiUser;
          return AbsensiPage(absensiUser: absensi);
        }
        if (state is AbsensiNull) {
          return MyLayout(
            title: "Absensi & KHS",
            body: MyNullDataPage(message: "Data absensi not found..."),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (context, state) {
        if (state is AbsensiError) {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return MyCupertinoAlertDialog(text: state.message);
            },
          );
        }
      },
    );
  }
}

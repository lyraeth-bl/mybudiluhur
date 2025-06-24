import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_layout.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_null_data_page.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_state.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/pages/ekstrakulikuler_page.dart';

class EkstrakulikulerLayout extends StatefulWidget {
  const EkstrakulikulerLayout({super.key});

  @override
  State<EkstrakulikulerLayout> createState() => _EkstrakulikulerLayoutState();
}

class _EkstrakulikulerLayoutState extends State<EkstrakulikulerLayout> {
  // Cubit
  late final authCubit = context.read<AuthCubit>().currentUser;
  late final ekstrakulikulerCubit = context.read<EkstrakulikulerCubit>();

  // Fetch data
  @override
  void initState() {
    super.initState();
    ekstrakulikulerCubit.fetchData(authCubit!.nis);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EkstrakulikulerCubit, EkstrakulikulerState>(
      builder: (context, state) {
        print("Ekstrakulikuler State : $state");
        if (state is EkstrakulikulerLoaded) {
          final data = state.ekstrakulikulerUser;
          return Scaffold(
            appBar: AppBar(
              title: MyText(text: "Ekstrakulikuler", bold: true),
              centerTitle: true,
              backgroundColor: Colors.lightBlue[400],
              foregroundColor: Colors.white,
            ),
            body: EkstrakulikulerPage(ekstrakulikulerUser: data),
          );
        }
        if (state is EkstrakulikulerNull) {
          return MyLayout(
            title: "Ekstrakulikuler",
            body: MyNullDataPage(message: "Ekstrakulikuler data not found..."),
          );
        }
        return MyLoadingScreen(
          text: "Loading your ekstrakulikuler...",
          title: "Ekstrakulikuler",
        );
      },
      listener: (context, state) {
        if (state is EkstrakulikulerError) {
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

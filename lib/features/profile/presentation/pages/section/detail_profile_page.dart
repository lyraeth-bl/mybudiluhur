import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/detail_profile_data.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/detail_profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/detail_profile_state.dart';

class DetailProfilePage extends StatefulWidget {
  const DetailProfilePage({super.key});

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  // Cubit
  late final detailProfileCubit = context.read<DetailProfileCubit>();

  // Fetch data
  @override
  void initState() {
    super.initState();
    detailProfileCubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailProfileCubit, DetailProfileState>(
      builder: (context, state) {
        if (state is DetailProfileLoaded) {
          final detailUser = state.detailProfileUser;
          return Scaffold(
            appBar: AppBar(
              title: MyText(text: "Detail Profile", bold: true),
              centerTitle: true,
              backgroundColor: Colors.lightBlue[400],
              foregroundColor: Colors.white,
            ),
            body: DetailProfileData(detailProfileUser: detailUser),
          );
        }
        return MyLoadingScreen(text: "Loading detail data...");
      },
      listener: (context, state) {
        if (state is DetailProfileError) {
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

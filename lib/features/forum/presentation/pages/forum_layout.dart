import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_null_data_page.dart';
import 'package:mybudiluhur/features/forum/presentation/cubit/forum_cubit.dart';
import 'package:mybudiluhur/features/forum/presentation/cubit/forum_state.dart';
import 'package:mybudiluhur/features/forum/presentation/pages/forum_page.dart';

class ForumLayout extends StatefulWidget {
  const ForumLayout({super.key});

  @override
  State<ForumLayout> createState() => _ForumLayoutState();
}

class _ForumLayoutState extends State<ForumLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumCubit, ForumState>(
      builder: (context, state) {
        if (state is ForumLoaded) {
          final forum = state.forumApp;
          return ForumPage();
        }
        if (state is ForumNull) {
          return MyNullDataPage(message: "Data Forum not found...");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (context, state) {
        if (state is ForumError) {
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

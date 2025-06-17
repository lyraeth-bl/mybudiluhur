import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_layout.dart';

class BudiluhurApp extends StatefulWidget {
  const BudiluhurApp({super.key});

  @override
  State<BudiluhurApp> createState() => _BudiluhurAppState();
}

class _BudiluhurAppState extends State<BudiluhurApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(title: "MyBudiLuhur", home: HomeLayout()),
    );
  }
}

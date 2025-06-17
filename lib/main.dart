import 'package:flutter/material.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MyBudiLuhur', home: const HomeLayout());
  }
}

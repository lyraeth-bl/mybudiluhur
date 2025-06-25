import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(text: "KHS"));
  }
}

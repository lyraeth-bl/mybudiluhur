import 'package:flutter/cupertino.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyCupertinoAlertDialog extends StatelessWidget {
  final String text;
  const MyCupertinoAlertDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const MyText(text: "MyBudiLuhur"),
      content: MyText(text: text),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class MyCupertinoAlertDialog extends StatelessWidget {
  final String text;
  const MyCupertinoAlertDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("MyBudiLuhur"),
      content: Text(text),
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

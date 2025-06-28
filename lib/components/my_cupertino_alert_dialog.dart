import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyCupertinoAlertDialog extends StatelessWidget {
  final String text;
  const MyCupertinoAlertDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: MyText(text: "MyBudiLuhur", bold: true, textSize: 20.r),
      content: Column(
        children: [
          SizedBox(height: 10.h),
          MyText(text: text, textSize: 14.r, maxLines: 3),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyText(text: 'Yes', textSize: 12.r),
        ),
      ],
    );
  }
}

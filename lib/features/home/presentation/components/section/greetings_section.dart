import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/greetings_cubit.dart';

class GreetingsSection extends StatelessWidget {
  const GreetingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeUser? homeUser = context.read<HomeCubit>().currentHomeUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: Container(
        padding: const EdgeInsets.all(5).r,
        // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
        child: Row(
          children: [
            AnimatedWavingHand(),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<GreetingsCubit, String>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(
                          text: '$state ',
                          textSize: 14.sp,
                          textColor: Theme.of(context).colorScheme.onSurface,
                        ),
                        MyContainer(
                          color: Theme.of(context).colorScheme.secondary,
                          child: MyText(
                            text: '${homeUser!.nama}!',
                            bold: true,
                            textSize: 14.sp,
                            textColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 5.h),
                MyText(
                  text: "Welcome back!, What's next?",
                  textSize: 12.sp,
                  textColor: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedWavingHand extends StatefulWidget {
  const AnimatedWavingHand({super.key});
  @override
  State<AnimatedWavingHand> createState() => _AnimatedWavingHandState();
}

class _AnimatedWavingHandState extends State<AnimatedWavingHand>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 0.5, // Adjust rotation angle as needed
          child: Transform.flip(
            flipX: true,
            child: Icon(LucideIcons.hand, size: 35.r),
          ),
        );
      },
    );
  }
}

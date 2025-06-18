import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/greetings_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';

class GreetingsSection extends StatelessWidget {
  const GreetingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeUser? homeUser = context.read<HomeCubit>().currentHomeUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(5),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
        child: Row(
          children: [
            AnimatedWavingHand(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<GreetingsCubit, String>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(text: '$state ', textSize: 18),
                        MyContainer(
                          color: Colors.amber[300],
                          child: MyText(
                            text: '${homeUser!.nama}!',
                            bold: true,
                            textSize: 18,
                            textColor: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 5),
                MyText(text: "Welcome back!, What's next?", textSize: 16),
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
            child: Icon(Icons.waving_hand_outlined, size: 40),
          ),
        );
      },
    );
  }
}

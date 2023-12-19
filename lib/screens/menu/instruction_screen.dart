import 'package:brick_balls_game/configs/device_size.dart';
import 'package:brick_balls_game/configs/styles.dart';
import 'package:flutter/material.dart';

import 'primary_background.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PrimaryBackground(
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(0, 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/rectangle.png",
                    width: DeviceSize.height(context, partNumber: 4),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 50),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: DeviceSize.width(context, partNumber: 6),
                    child: Text(
                      "Your job is to hold out as long as possible.\n\nShoot, break blocks, collect balls. Become a record-breaker.",
                      textAlign: TextAlign.center,
                      style: style.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 155),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "HOW TO PLAY?",
                    style: style.copyWith(fontSize: 36),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/back_btn.png')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/custom_btn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  const SizedBox(width: 5),
                  DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      height: 60.51 / 50,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [WavyAnimatedText('Flash Chat')],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const CustomButton(isLogin: true),
              const SizedBox(height: 24),
              const CustomButton(isLogin: false),
            ],
          ),
        ),
      ),
    );
  }
}

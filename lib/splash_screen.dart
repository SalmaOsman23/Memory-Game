import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/level_screen.dart';
import 'package:memory_game/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    //! Initialize the animation controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    //! Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //! Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //! Start the animation
    _controller.forward();

    //! Navigate to the HomePage after a delay
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LevelScreen()));
    });

    //! Dispose the controller to free up resources
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEC4343),
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.memoryTitleImage,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset(
                AppAssets.cheeringDude,
                width: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}

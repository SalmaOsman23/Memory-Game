import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEC4343),
      body: Column(
        children: [
          SvgPicture.asset(AppAssets)
        ],
      ),
    );
  }
}
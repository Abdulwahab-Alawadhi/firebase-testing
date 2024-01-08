import 'package:firebase/app/core/extenstions/build_context_extenstion.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: context.screenWidth * 0.2,
          width: context.screenHeight * 0.2,
          child: Center(child: Text(context.translate.login))),
    );
  }
}

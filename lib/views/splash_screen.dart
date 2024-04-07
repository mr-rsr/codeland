import 'dart:async';

import 'package:codeland/res/colors.dart';
import 'package:codeland/res/image.dart';
import 'package:codeland/views/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: Center(
        child: Container(
          width: 224,
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(63),
            color: primaryColor,
            border: Border.all(color: const Color(0xffF68326), width: 1),
            boxShadow: [
              BoxShadow(
                color: fontColor.withOpacity(0.5),
                offset: const Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(codelandCloudLogo),
                  width: 180,
                  height: 180,
                ),
                Image(
                  image: AssetImage(codelandLogo),
                  width: 144,
                  height: 91,
                ),
              ]),
        ),
      ),
    );
  }
}

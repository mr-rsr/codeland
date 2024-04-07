import 'package:codeland/res/colors.dart';
import 'package:codeland/views/image_upload_page.dart';
import 'package:codeland/views/login_page.dart';
import 'package:codeland/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Codeland',
      home: const SplashScreen(),
    );
  }
}

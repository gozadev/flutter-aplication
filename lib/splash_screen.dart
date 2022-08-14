// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/auth/phone_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => SplashScreenStart());
  }

  SplashScreenStart() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PhoneAuth()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ignore: prefer_const_constructors
            Lottie.asset(
              'images/logo_morphing_concept.zip',
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
            // ignore: prefer_const_constructors
            Text(
              'Welcome My App',
              style: GoogleFonts.kanit(fontSize: 40),
            )
          ]),
        ),
      ),
    );
  }
}

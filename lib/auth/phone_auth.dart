// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/auth/sms_otp.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final _phoneNumber = TextEditingController();
  // String _verificationId = "";
  // Future phoneCheck() async {

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //icon
            // ignore: prefer_const_constructors
            Icon(
              Icons.phone_android,
              size: 200,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 75,
            ),
            //title
            Text("Hello Again",
                style: GoogleFonts.bebasNeue(
                  fontSize: 38,
                )),
            SizedBox(height: 10),
            //title
            Text(
              "Welcome Back, you've been missed!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // textfield number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _phoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                    FilteringTextInputFormatter.deny(
                      RegExp(r'^0+'), //users can't type 0 at 1st position
                    ),
                  ],
                  decoration: InputDecoration(
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+62'),
                      ),
                      border: InputBorder.none,
                      hintText: "Masukan No Handphone Anda"),
                ),
              ),
            ),
            SizedBox(height: 20),
            // submit
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SmsOtp(_phoneNumber.text)));
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Sudah Punya akun ? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Silahkan Login',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        )),
      )),
    );
  }
}

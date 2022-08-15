// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class CreatePassword extends StatelessWidget {
  final _password = TextEditingController();

  void setPreference() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('password')) {
      prefs.clear();
    }

    prefs.setString('password', _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.password_sharp,
              size: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Silahkan buat password anda dengan minimal dan maksimal 6 digit angka',
                style: GoogleFonts.ptSans(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    controller: _password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan password anda"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  setPreference();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Create',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}

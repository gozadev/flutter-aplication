// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? password;
  final _password = TextEditingController();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getPreference());
  }

  void getPreference() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('password')) {
      password = prefs.getString('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // ignore: prefer_const_constructors
        Icon(
          Icons.key_off_outlined,
          size: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Silahkan Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
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
                keyboardType: TextInputType.number,
                obscureText: true,
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
              if (_password.text == password) {
                Navigator.of(context)
                    // ignore: prefer_const_constructors
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              } else {
                print('gagal');
              }
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    )));
  }
}

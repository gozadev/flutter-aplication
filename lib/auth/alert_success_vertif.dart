import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/auth/create_password.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertSuccessVerif extends StatelessWidget {
  const AlertSuccessVerif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 200,
              color: Colors.green,
            ),
            Text('No Handphone Anda Berhasil Diverfikasi',
                style: GoogleFonts.ptSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[300])),
            SizedBox(
              height: 15,
            ),
            Text(
              'Untuk Mengakses aplikasi dibutuhkan password pribadi untuk itu silahkan buat password anda dengan menekan tombol buat password',
              style:
                  GoogleFonts.ptSans(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreatePassword()));
              }),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Buat Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}

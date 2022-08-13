// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SmsOtp extends StatefulWidget {
  final String phoneNumber;

  SmsOtp(this.phoneNumber);

  @override
  State<SmsOtp> createState() => _SmsOtpState();
}

class _SmsOtpState extends State<SmsOtp> {
  // ignore: unused_element

  // fungsi untuk menjalankan fungsi saat page dibuka
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) => phoneCheck());
  // }

  Future phoneCheck() async {
    print("test menjalankan function");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sms OTP telah dikirimkan ke nomor berikut',
              style:
                  GoogleFonts.ptSans(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Text('+62${widget.phoneNumber}',
                style: GoogleFonts.ubuntu(fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Anda tidak perlu memasukan kode OTP karena system automatis mendeteksi kode OTP yang kirimkan, jika kode OTP juga belum diterima silahkan kirim ulang kode OTP dibawah tunggu selama 2 menit ',
                style: GoogleFonts.ptSans(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

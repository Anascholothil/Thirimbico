import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/constance/callfunction.dart';
import 'package:thirmbico/homepage.dart';
import 'package:thirmbico/provider/loginProvider.dart';
import 'package:thirmbico/provider/mainprovider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPintheme = PinTheme(
      width: 68,
      height: 72,
      textStyle: TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffedb1f7),
          border: Border.all(color: Colors.transparent)),
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          margin: EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "OTP VERIFICATION",
                style: TextStyle(
                  color: Color(0xffedb1f7),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Enter the code sent to your number here",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
              Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return Pinput(
                    controller: value.otpController,
                    length: 6,
                    defaultPinTheme: defaultPintheme,
                    focusedPinTheme: defaultPintheme.copyWith(
                      decoration: defaultPintheme.decoration!.copyWith(
                        border: Border.all(color: Color(0xffedb1f7)),
                      ),
                    ),
                    onCompleted: (pin) {
                      value.verify(context);

                    },
                  );
                }
              ),
              SizedBox(
                height: 400,
              ),
              Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return SizedBox();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

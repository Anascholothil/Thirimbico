import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),

      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/failedicon.png')),
        SizedBox(height: 20),
        Text(
          'Payment failed !',
          style: GoogleFonts.jua(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0xffE73535),
          ),
        ),
      ],
    ),
    );
  }
}

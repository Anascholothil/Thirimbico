import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderpage.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/success.png')),
          SizedBox(height: 20),
          Text(
            'Payment Suceesfull !',
            style: GoogleFonts.jua(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(
                0xff712C62,
              ),
            ),
          ),
        ],
      ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OderScreen(),
                    ),
                  );
                },
                child: Container(
                  height: height/18,
                  width: width/1.6,
                  decoration: const BoxDecoration(
                    color: Color(0xffedb1f7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Show my Order',
                      style: GoogleFonts.jua(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )

    );
  }
}

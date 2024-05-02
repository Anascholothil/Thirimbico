import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/constance/callfunction.dart';
import 'package:thirmbico/provider/loginProvider.dart';
import 'package:thirmbico/provider/mainprovider.dart';
// import 'package:thirmbico/signup.dart';
import 'package:thirmbico/signup.dart';

import 'otpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LoginScreen> {
  bool hidepass = false;

  // void hidepassword() {
  //   setState(() {
  //     if (hidepass == true) {
  //       hidepass = false;
  //     } else {
  //       hidepass = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        decoration: const BoxDecoration(color: Color(0xffedb1f7)),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset('assets/Thirimbi.Co.png'),
            ),
           const SizedBox(
              height: 140,
            ),
            Expanded(
              child: Container(
                decoration:const  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        style: GoogleFonts.jua(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color:const Color(0xffEDB1F7),
                        ),
                      ),

                     const  SizedBox(
                        height: 25,
                      ),
                      Consumer<LoginProvider>(builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            keyboardType: TextInputType.phone,
                            controller: value.phoneController,
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              hintStyle:
                                  GoogleFonts.jua(color: const Color(0xff817D8F),fontSize: 18),
                              suffixIcon: const Icon(
                                Icons.phone_android,
                                color: Color(0xff817D8F),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffEDB1F7)),
                              ),
                              fillColor:const Color(0xffFADEF7),
                              filled: true,
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 30,
                      ),

//         Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 25.0),
//      child: TextField(
//        obscureText:hidepass == true? false:true,
//        decoration: InputDecoration(
//          suffixIcon: InkWell(
//            onTap: () {
//              hidepassword();
//            },
//              child: Icon(Icons.remove_red_eye,color: Color(0xff817D8F),)),
//          hintText: 'Password',
// hintStyle: GoogleFonts.jua(color: Color(0xff817D8F)),
// enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.white),
//     borderRadius: BorderRadius.circular(20),
// ),
//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Color(0xffEDB1F7)),
//          ),
//          fillColor: Color(0xffFADEF7),
//          filled: true,
//        ),
//      ),
//  ),
                     const  SizedBox(
                        height: 7,
                      ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 46.0),
                      //       child: Text('Forgot password ?',style: GoogleFonts.jua(
                      //           fontWeight: FontWeight.w500,color: Color(0xff817D8F),
                      //           fontSize: 15)
                      //          ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: height / 70,
                      ),
                      Consumer<LoginProvider>(builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.sendotp(context);
                          },
                          child: Container(
                            height: 45,
                            width: 180,
                            decoration: BoxDecoration(
                              color:const Color(0xffFADEF7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text('Get OTP',
                                  style: GoogleFonts.jua(
                                      fontSize: 20,
                                      color:const Color(0xff817D8F),
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        );
                      }),
                     const SizedBox(
                        height: 22,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 35.0),
                      //   child: SingleChildScrollView(
                      //     child: Row(
                      //
                      //       children: [
                      //         Image.asset('assets/Line.png'),
                      //         SizedBox(
                      //           width: 12,
                      //         ),
                      //         Text('or login with',style: GoogleFonts.jua(color: Color(0xff817D8F),
                      //             fontSize: 16),),
                      //         SizedBox(
                      //           width: 12,
                      //         ),
                      //         Image.asset('assets/Line.png'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: width / 5,
                            decoration:const  BoxDecoration(color: Colors.black),
                          ),
                         const  SizedBox(
                            width: 15,
                          ),
                          Text(
                            'or login with',
                            style: GoogleFonts.jua(
                                color:const  Color(
                                  0xff817D8F,
                                ),
                                fontSize: 16),
                          ),
                        const   SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 1,
                            width: width / 5,
                            decoration:const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                     const  SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/google.png',
                                scale: 1.1,
                              )),
                        const  SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              child:
                                  Image.asset('assets/apple.png', scale: 1.1)),
                          const  SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              child: Image.asset(
                            'assets/fb.png',
                            scale: 1.1,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.jua(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const  SizedBox(
                            width: 6,
                          ),
                          Consumer< MainProvider>(
                            builder: (context,val,child) {
                              return InkWell(
                                onTap: () {
                                  val.profclear();
                                  callNext(context,const SignupPage());
                                },
                                child: Text(
                                  'Sign up',
                                  style: GoogleFonts.jua(
                                      fontSize: 15,
                                      color:const Color(
                                        0xffedb1f7,
                                      ),
                                      fontWeight: FontWeight.w800),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

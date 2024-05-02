import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:thirmbico/constance/callfunction.dart';
// import 'package:thirmbico/paymentsucees.dart';
import 'package:thirmbico/paymentsucees.dart';
import 'package:thirmbico/provider/mainprovider.dart';

import '../adresspage.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({super.key});

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.jua(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Container(
                    height: 160,
                    width:width/1.119,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(width: .1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 13,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pickup address',
                                style: GoogleFonts.jua(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DottedBorder(
                                color: Color(0xffedb1f7),
                                strokeWidth: 2.5,
                                dashPattern: [7, 8],
                                child: GestureDetector(
                                  onTap: () {
                                    value.profclear();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdreesScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 105,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffdf2ff),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AdreesScreen(),
                                                  ),
                                                );
                                              },
                                              child: Icon(Icons.add, size: 17)),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Add new address',
                                          style: GoogleFonts.jua(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 210,
              width: 345,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 13, offset: Offset(0, 1)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(width: .1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'Order summary',
                      style: GoogleFonts.jua(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'W & F',
                        style: GoogleFonts.jua(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        '=',
                        style: GoogleFonts.jua(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '₹',
                        style: GoogleFonts.jua(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffeeb2f7)),
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Text(
                            value.getTotalPrice().toString(),
                            style: GoogleFonts.jua(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          );
                        }
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 1,
                    width: width / 1.5,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.jua(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Text(
                        '=',
                        style: GoogleFonts.jua(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '₹',
                        style: GoogleFonts.jua(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffeeb2f7)),
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Text(
                            value.getTotalPrice().toString(),
                            style: GoogleFonts.jua(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          );
                        }
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Payment methods',
            //       style: GoogleFonts.jua(
            //         fontSize: 27,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Column(
            //   children: [
            //     Container(
            //       height: height / 19,
            //       width: width / 1.199,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(
            //           18,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey,
            //               blurRadius: 13,
            //               offset: Offset(0, 5)),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Radio(activeColor: Color(0xffeeb2f7),
            //                 value: 1,
            //                 groupValue: _value,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     _value = value!;
            //                   });
            //                 },
            //               ),
            //               Text(
            //                 'Credit/Debit card',
            //                 style: GoogleFonts.jua(
            //                   fontSize: 22,
            //                   fontWeight: FontWeight.w500,
            //
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //
            //
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //             child: Image.asset('assets/card.png',),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //     Container(
            //       height: height / 19,
            //       width: width / 1.199,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(
            //           18,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey,
            //               blurRadius: 13,
            //               offset: Offset(0, 5)),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //       Radio(activeColor: Color(0xffeeb2f7),
            //       value: 2,
            //       groupValue: _value,
            //       onChanged: (value) {
            //         setState(() {
            //           _value = value!;
            //         });
            //       },
            //     ),
            //     Text(
            //       'Pay on crypto',
            //       style: GoogleFonts.jua(
            //         fontSize: 22,
            //         fontWeight: FontWeight.w500,
            //
            //       ),
            //     ),
            //
            //             ],
            //           ),
            //
            //
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //             child: Image.asset('assets/Bitcoin.png',),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),Container(
            //       height: height / 19,
            //       width: width / 1.199,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(
            //           18,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey,
            //               blurRadius: 13,
            //               offset: Offset(0, 5)),
            //         ],
            //       ),
            //
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Radio(activeColor: Color(0xffeeb2f7),
            //                 value: 3,
            //                 groupValue: _value,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     _value = value!;
            //                   });
            //                 },
            //               ),
            //               Text(
            //                 'UPI',
            //                 style: GoogleFonts.jua(
            //                   fontSize: 22,
            //                   fontWeight: FontWeight.w500,
            //
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //
            //
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //             child: Image.asset('assets/upi.png',),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                    onTap: () {
                      value.razorpayGateway('Anas',num.parse(value.getTotalPrice().toString()),'Your payment',);
                      callNextReplacement(context,SuccessScreen());

                    },
                    child: Container(
                      height: 45,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Color(0xffedb1f7),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Pay',
                          style: GoogleFonts.jua(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        )
    );
  }
}

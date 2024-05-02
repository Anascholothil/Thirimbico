import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/homepage.dart';
import 'package:thirmbico/paymentsucees.dart';
import 'package:thirmbico/provider/mainprovider.dart';
import 'package:thirmbico/timeslot.dart';

import 'homepage.dart';

class OderScreen extends StatelessWidget {
  const OderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffedb1f7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 2.5,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, top: 10),
                              child: Text(
                                'items',
                                style: GoogleFonts.jua(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Quantity',
                                style: GoogleFonts.jua(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 10),
                              child: Text(
                                'Price',
                                style: GoogleFonts.jua(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'shirt',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '04',
                              style: GoogleFonts.jua(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                '₹ 21',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'T-shirt',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '03',
                              style: GoogleFonts.jua(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                '₹ 21',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Pants/Jeans',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '02',
                              style: GoogleFonts.jua(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                '₹ 21',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'Jackets',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '01',
                              style: GoogleFonts.jua(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                '₹ 21',
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 55),
                          height: 1,
                          width: width / 1,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 18),
                          child: Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: GoogleFonts.jua(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                    ),
                                    child: Text(
                                      '₹  '+
                              value.getTotalPrice().toString(),
                                      style: GoogleFonts.jua(
                                          fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: height / 3,
              width: width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0,left: 18),
                    child: Text(
                      'Pickup address',
                      style: GoogleFonts.jua(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 18),
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return Row(

                          children: [
                            Text(
                             value.adressController.text,
                              style: GoogleFonts.jua(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                             value.adresszipController.text,
                              style: GoogleFonts.jua(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                        'Pickup Time',
                        style: GoogleFonts.jua(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 10),
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return Text(
                      value.timeController.text,
                          style: GoogleFonts.jua(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                    ),
                  ),

                ],
              ),
            ),
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
                      print("dcvdhgcvdc"+value.fcmid);
                     value.callOnFcmApiSendPushNotifications(
                         title: "Your order is requested",
                         body: '',
                         fcmId: "dn4X3bl3R7acrewSPA7_3l:APA91bFNexg-As8vgJsI8PyUzN0vGOtEDcMqOw3BHH8gedB-a6ERXZbeKyMJ0SsSulvLd444Mp1l63I3iY6JfzZXjPdAw-T_OogpTrdv1iD-tjSAx209Y__FcQ4lvGVPlXTtrUOFDiTO",
                         imageLink: ''

                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimeslotPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: width/3,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: GoogleFonts.jua(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffedb1f7),
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

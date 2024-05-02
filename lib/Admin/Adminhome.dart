import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/Admin/servicetype.dart';
import 'package:thirmbico/Admin/requestpage.dart';
import 'package:thirmbico/Admin/userslist.dart';
import 'package:thirmbico/LoginScreen.dart';
import 'package:thirmbico/provider/mainprovider.dart';

import '../constance/callfunction.dart';
import 'bookingservices.dart';
import 'clothtype.dart';

class AdminPages extends StatelessWidget {
  const AdminPages({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffedb1f7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                SizedBox(
                  height: height / 8,
                ),
                GestureDetector(
                  onTap: () {
                    value.getrequesteduser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/leftbox.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Requests',
                            style: GoogleFonts.jua(
                                color: Color(0xffedb1f7), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                GestureDetector(
                  onTap: () {
                    value.getServices();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LuandryAdminScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/rightbox.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Laundry Services List',
                            style: GoogleFonts.jua(
                                color: Color(0xffedb1f7), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        value.getUserInfo();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserslistServices(),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('assets/leftbox.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Users List',
                                style: GoogleFonts.jua(
                                    color: Color(0xffedb1f7), fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: height / 15,
                ),
                GestureDetector(
                  onTap: () {
                    value.getClothType();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClothTypeadmin(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/rightbox.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Cloth Types',
                            style: GoogleFonts.jua(
                                color: Color(0xffedb1f7), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingsServices(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/leftbox.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Bookings',
                            style: GoogleFonts.jua(
                                color: Color(0xffedb1f7), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height/13,
                ),
                GestureDetector(

                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              elevation: 20,
                              content:  Text(
                                  "Do you want to Logout ?",style: TextStyle(
                                  fontSize:17,

                                  fontFamily:'ink nut',
                                  fontWeight: FontWeight.w700,
                                  color:Color(0xffedb1f7))),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        FirebaseAuth auth = FirebaseAuth.instance;
                                        auth.signOut();
                                        callNextReplacement(context, LoginScreen());
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color:Colors.white ,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2.0, // soften the shadow
                                                spreadRadius: 1.0, //extend the shadow
                                              ),
                                            ] ),
                                        child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: (){
                                          finish(context);
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 90,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color(0xffedb1f7),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2.0, // soften the shadow
                                                spreadRadius: 1.0, //extend the shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(child: Text("No",style: TextStyle( color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                                        ))
                                  ],
                                )

                              ],
                            ),
                          );
                        },

                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/rightbox.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Log Out',
                            style: GoogleFonts.jua(
                                color: Color(0xffedb1f7), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

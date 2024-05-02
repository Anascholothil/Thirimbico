import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:thirmbico/paymentsucees.dart';
import 'package:thirmbico/paymentsucees.dart';
import 'package:thirmbico/provider/mainprovider.dart';

class AdreesScreen extends StatelessWidget {
  const AdreesScreen({super.key});

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
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Address',
          style: GoogleFonts.jua(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height:30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First name',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: width / 2.3,
                            decoration: BoxDecoration(),
                            child: TextField(
                              controller: value.adrss1stnameController,
                              decoration: InputDecoration(
                                // isDense: true,

                                // isCollapsed: true,

                                contentPadding: EdgeInsets.all(5),

                                // hintText: 'Search..',

                                hintStyle: GoogleFonts.jua(
                                    color: Color(0xffcdcdcd), fontSize: 19),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFADEF7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDB1F7)),
                                ),

                                fillColor: Colors.white,

                                filled: true,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),     Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last name',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: width / 2.3,
                            decoration: BoxDecoration(),
                            child: TextField(
                              controller: value.adrss2ndnameController,
                              decoration: InputDecoration(
                                // isDense: true,

                                // isCollapsed: true,

                                contentPadding: EdgeInsets.all(5),

                                // hintText: 'Search..',

                                hintStyle: GoogleFonts.jua(
                                    color: Color(0xffcdcdcd), fontSize: 19),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFADEF7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDB1F7)),
                                ),

                                fillColor: Colors.white,

                                filled: true,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: width / 1.2,
                            decoration: BoxDecoration(),
                            child: TextField(
                              controller: value.adressController,
                              decoration: InputDecoration(
                                // isDense: true,

                                // isCollapsed: true,

                                contentPadding: EdgeInsets.all(5),

                                // hintText: 'Search..',

                                hintStyle: GoogleFonts.jua(
                                    color: Color(0xffcdcdcd), fontSize: 19),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFADEF7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDB1F7)),
                                ),

                                fillColor: Colors.white,

                                filled: true,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ), SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: width / 1.2,
                            decoration: BoxDecoration(),
                            child: TextField(
                              controller: value.cityController,
                              decoration: InputDecoration(
                                // isDense: true,

                                // isCollapsed: true,

                                contentPadding: EdgeInsets.all(5),

                                // hintText: 'Search..',

                                hintStyle: GoogleFonts.jua(
                                    color: Color(0xffcdcdcd), fontSize: 19),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFADEF7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDB1F7)),
                                ),

                                fillColor: Colors.white,

                                filled: true,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ), SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'State/Province',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Container(
                        height: 50,
                        width: width / 1.2,
                        decoration: BoxDecoration(),
                        child: TextField(
                          decoration: InputDecoration(
                            // isDense: true,

                            // isCollapsed: true,

                            contentPadding: EdgeInsets.all(5),

                            // hintText: 'Search..',

                            hintStyle: GoogleFonts.jua(
                                color: Color(0xffcdcdcd), fontSize: 19),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFADEF7),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEDB1F7)),
                            ),

                            fillColor: Colors.white,

                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            
            ), SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zip/Pincode',
                        style: GoogleFonts.jua(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: width / 1.2,
                            decoration: BoxDecoration(),
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                              ],
                              keyboardType: TextInputType.number,
                              controller: value.adresszipController,
                              decoration: InputDecoration(
                                // isDense: true,

                                // isCollapsed: true,

                                contentPadding: EdgeInsets.all(5),

                                // hintText: 'Search..',

                                hintStyle: GoogleFonts.jua(
                                    color: Color(0xffcdcdcd), fontSize: 19),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFADEF7),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDB1F7)),
                                ),

                                fillColor: Colors.white,

                                filled: true,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
        bottomNavigationBar: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: GestureDetector(
                    onTap: () {
                      value.adressController.text+value.adresszipController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessScreen(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 45,
                        width: width/2.8,
                        decoration: const BoxDecoration(
                          color: Color(0xffedb1f7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: GoogleFonts.jua(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderdetails.dart';

class BookingsServices extends StatefulWidget {
  const BookingsServices({super.key});

  @override
  State<BookingsServices> createState() => _BookingsState();
}

class _BookingsState extends State<BookingsServices> {
  String dropdownvalue = "To pickup";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Bookings",
          style: GoogleFonts.jua(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 28),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 16,
              itemBuilder: (BuildContext Context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 28),
                  child: Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffedb1f7), width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 9, left: 16),
                      child: Column(
                        children: [
                          Row(

                            children: [
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name",
                                      style: GoogleFonts.jua(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),Text(
                                ":",
                                style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),Text(
                                "Stephen Strange69",
                                style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Address",
                                      style: GoogleFonts.jua(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      ":",
                                      style: GoogleFonts.jua(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ), Text(
                                "NN rd",
                                style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Phone",
                                      style: GoogleFonts.jua(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),Text(
                                      ":",
                                      style: GoogleFonts.jua(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ) ,
                              Text(
                                "0000000000",
                                style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Order Status : ",
                                style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 30,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Color(0xffedb1f7),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    items: [
                                      DropdownMenuItem(
                                          child: Text("To pickup"),
                                          value: "To pickup"),
                                      DropdownMenuItem(
                                          child: Text("To deliver"),
                                          value: "To deliver"),
                                      DropdownMenuItem(
                                          child: Text("Processing"),
                                          value: "Processing"),
                                      DropdownMenuItem(
                                          child: Text("delivering"),
                                          value: "delivering"),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue = value!;
                                      });
                                    },
                                    value: dropdownvalue,
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconEnabledColor: Colors.black,
                                    dropdownColor: Color(0xffedb1f7),
                                    style: GoogleFonts.jua(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height/24,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 32,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffedb1f7),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetails(),));
                                    },
                                    child: Text(
                                      "Order Details",
                                      style: GoogleFonts.jua(color: Colors.white,fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Row(

                                  children: [
                                    InkWell(
                                        child: Image.asset('assets/phoneicon.png')),
                                    SizedBox(width: 15,),
                                    InkWell(
                                        child: Image.asset('assets/waicon.png')),
                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
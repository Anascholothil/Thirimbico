import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {

  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int _value = 0;
  String DropDownvalue ="Washing";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color:  Color(
              0xffedb1f7,
            ),
          ),
        ),
        title: Text(
          'Order details',
          style: GoogleFonts.jua(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color:  Color(
            0xffedb1f7,
          ),
          ),
        ),
        // backgroundColor: Color(
        //   0xffedb1f7,
        // ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height/2.2,
                width: width/1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(0xffedb1f7)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35,top: 21),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          SizedBox(
                            width:80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name',
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),


                          Text(":",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
                          Text(" Stephen",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [

                          SizedBox(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Phone",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),

                          Text(": ",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),), Text("0000000000",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(
                            width:80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Service",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),
                          Text(": ",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),

                          Container(
                            width: 170,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropdownButton(

                                isExpanded: true,
                                items: [
                                DropdownMenuItem(
                                    child: Text(
                                      "Washing",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),                                    ),),
                                  value: "Washing",),


                                DropdownMenuItem(
                                  child: Text(
                                    "Ironing",style: GoogleFonts.jua(
                                    color: Color(0xffb4b4b4),                                  ),),
                                  value: "hah",),


                                DropdownMenuItem(
                                  child: Text(
                                    "Dry Cleaning",style: GoogleFonts.jua(
                                    color: Color(0xffb4b4b4),                                  ),),
                                  value: "dash",),


                                DropdownMenuItem(
                                  child: Text(
                                    "Starching",style: GoogleFonts.jua(
                                    color: Color(0xffb4b4b4),                                  ),),
                                  value: "processing",),


                              ], onChanged: (value){
                                setState(() {
                                  DropDownvalue =value!;

                                });
                              },
                                value: DropDownvalue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),


                        ],



                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [

                          SizedBox(
                            width:110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Date",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 20,
                            child: Text(": ",
                              style: GoogleFonts.jua(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ), Text("Oct 07",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
                        ],
                      ),   SizedBox(height: 10),
                      Row(
                        children: [

                          SizedBox(
                            width:110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Time",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 20,
                            child: Text(": ",
                              style: GoogleFonts.jua(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ), Text("12:00 am",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(
                            width:width/3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Date",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),
                          Text(": ",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
// SizedBox(width: 40,),
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropdownButton(
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Oct 27",style: GoogleFonts.jua(
                                        color: Color(0xffb4b4b4),
                                    ),),
                                    value: "Washing",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "jan 16",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "hah",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "Dry Cleaning",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "dash",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "Starching",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "processing",),


                                ], onChanged: (value){
                                setState(() {
                                  DropDownvalue =value!;

                                });
                              },
                                value: DropDownvalue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),


                        ],



                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [

                          SizedBox(
                            width:100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Payment",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 10,
                            child: Text(": ",
                              style: GoogleFonts.jua(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),  Row(
                            children: [
                              Radio(activeColor: Colors.blue,
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                },
                              ),
                              Text(
                                "Paid",
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                              Radio(activeColor: Colors.blue,
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                },
                              ),
                              Text(
                                "not Paid",
                                style: GoogleFonts.jua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(
                            width:width/2.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Payment Method",
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),),
                              ],
                            ),
                          ),
                          Text(": ",
                            style: GoogleFonts.jua(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 22,
                            ),),
// SizedBox(width: 40,),
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropdownButton(
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Oct 27",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "Washing",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "jan 16",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "hah",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "Dry Cleaning",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "dash",),


                                  DropdownMenuItem(
                                    child: Text(
                                      "Starching",style: GoogleFonts.jua(
                                      color: Color(0xffb4b4b4),
                                    ),),
                                    value: "processing",),


                                ], onChanged: (value){
                                setState(() {
                                  DropDownvalue =value!;

                                });
                              },
                                value: DropDownvalue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),


                        ],



                      ),


                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

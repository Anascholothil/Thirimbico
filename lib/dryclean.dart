import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/provider/mainprovider.dart';
// import 'package:thirmbico/timeslot.dart';
import 'package:thirmbico/timeslot.dart';

class DrycleanPage extends StatelessWidget {
  const DrycleanPage({super.key});

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
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, bottom: 10),
              child: Image.asset(
                'assets/menu inver.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    children: [
                      Text(
                        '  Dry cleaning',
                        style: GoogleFonts.jua(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Positioned(
                  top: height * 0.25,

                  // top: 50,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                    ),
                    child: Container(
                      height: 50,
                      width: width * 0.8,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 13,
                              offset: Offset(0, 0)),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 5, right: 15),
                            child: Image.asset(
                              'assets/searchicon.png',
                              scale: 1,
                            ),
                          ),

                          // isDense: true,

                          // isCollapsed: true,

                          contentPadding: EdgeInsets.all(9),

                          hintText: 'Search',
                          focusColor: Color(0xffedb1f7),

                          hintStyle: GoogleFonts.jua(
                              color: Color(0xffbfbfbf), fontSize: 24),

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
                  ),
                ),
                Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Container(
                        child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.images.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                                  child: Card(
                                    color:  value.colors[index],
                                    elevation: 5,
                                    child: Container(
                                      width: 48,
                                      height: 51,
                                      decoration: BoxDecoration(
                                        color: value.colors[index],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),

                                      ),
                                      child: Image.asset(
                                        value.images[index],
                                        scale: 1.3,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0, left: 15),
                                      child: Text(
                                        value.text[index],
                                        style: GoogleFonts.jua(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        value.price[index],
                                        style: GoogleFonts.jua(
                                            color: Color(0xffeeb2f7), fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xffeeb2f7),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        value.Decrement(0);


                                      }, child: Image.asset('assets/minus.png')),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  value.count.toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xffeeb2f7),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        value.Increment(0);
                                      }, child: Image.asset('assets/addicon.png')),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            );
                          },),
                      );
                    }
                )













              ])
      ),
      bottomNavigationBar:  Container(
        height: 80,
        decoration:
        BoxDecoration(border: Border.all(width: .3, color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimeslotPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 43,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(0xffeeb2f7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Timeslot',
                          style: GoogleFonts.jua(
                              fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Image.asset('assets/Arrow right.png')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 15,
                  ),
                  child: Text(
                    'Total',
                    style: GoogleFonts.jua(
                      fontSize: 20,
                      color: Color(
                        0xff735E5E,
                      ),
                    ),
                  ),
                ),
                Text(
                  '₹54',
                  style: GoogleFonts.jua(
                    color: Color(0xffeeb2f7),
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

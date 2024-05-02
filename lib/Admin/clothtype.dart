import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/mainprovider.dart';
import 'ColothtypeAdd.dart';

class ClothTypeadmin extends StatelessWidget {
  const ClothTypeadmin({super.key});

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
                    ' Cloth Type',
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
                  decoration: BoxDecoration(
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
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 25.0, top: 20),
            //       child: Card(
            //         color: Color(0xffffd9d9),
            //         elevation: 5,
            //         child: Container(
            //           width: 48,
            //           height: 51,
            //           decoration: BoxDecoration(
            //             color: Color(0xffffd9d9),
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(20),
            //             ),
            //             // boxShadow: [
            //             // BoxShadow(
            //             // blurRadius: 15.0,
            //             // ),
            //             //
            //             // ],
            //           ),
            //           child: Image.asset(
            //             'assets/shirtN.png',
            //           ),
            //         ),
            //       ),
            //     ),
            //     Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(top: 30.0, left: 15),
            //           child: Text(
            //             'Shirt',
            //             style: GoogleFonts.jua(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //         Text(
            //           '₹20',
            //           style: GoogleFonts.jua(
            //               color: Color(0xffeeb2f7), fontSize: 13),
            //         )
            //       ],
            //     ),
            //     Expanded(child: Container()),
            //     Container(
            //       width: 25,
            //       height: 25,
            //       decoration: BoxDecoration(
            //         color: Color(0xffeeb2f7),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //       ),
            //       child: InkWell(
            //           onTap: () {}, child: Image.asset('assets/minus.png')),
            //     ),
            //     SizedBox(
            //       width: 4,
            //     ),
            //     Text(
            //       '01',
            //       style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 4,
            //     ),
            //     Container(
            //       width: 25,
            //       height: 25,
            //       decoration: BoxDecoration(
            //         color: Color(0xffeeb2f7),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //       ),
            //       child: InkWell(
            //           onTap: () {}, child: Image.asset('assets/addicon.png')),
            //     ),
            //     SizedBox(
            //       width: 15,
            //     ),
            //   ],
            // ),

            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Container(
                    child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.clothtypeList.length,
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
                                  child: Image.network(

                                    value.clothtypeList[index].Image,
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
                                    value.clothtypeList[index].Clothsname,
                                    style: GoogleFonts.jua(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    " ₹ " +
                                    value.clothtypeList[index].Price,
                                    style: GoogleFonts.jua(
                                        color: Color(0xffeeb2f7), fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            // Container(
                            //   width: 25,
                            //   height: 25,
                            //   decoration: BoxDecoration(
                            //     color: Color(0xffeeb2f7),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(30),
                            //     ),
                            //   ),
                            //   child: InkWell(
                            //       onTap: () {
                            //         value.Decrement(0);
                            //
                            //
                            //       }, child: Image.asset('assets/minus.png')),
                            // ),
                            // SizedBox(
                            //   width: 4,
                            // ),
                            // Text(
                            //   value.count.toString(),
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(
                              width: 4,
                            ),
                            // Container(
                            //   width: 25,
                            //   height: 25,
                            //   decoration: BoxDecoration(
                            //     color: Color(0xffeeb2f7),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(30),
                            //     ),
                            //   ),
                            //   child: InkWell(
                            //       onTap: () {
                            //         value.Increment(0);
                            //       }, child: Image.asset('assets/addicon.png')),
                            // ),
                            // SizedBox(
                            //   width: 15,
                            // ),
                          ],
                        );
                      },),
                  );
                }
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return GestureDetector(
            onTap: () {
              value.clearclothtype();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => ClothSub(),
              ),);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xffedb1f7),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child:  Icon(
                  Icons.add,
                  color: Colors.white,
                ),

            ),
          );
        }
      ),
    );
  }
}

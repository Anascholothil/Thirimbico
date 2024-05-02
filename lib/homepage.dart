import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thirmbico/dryclean.dart';
import 'package:thirmbico/ironing.dart';
import 'package:thirmbico/provider/mainprovider.dart';
import 'package:thirmbico/starching.dart';
import 'package:thirmbico/vewall_services.dart';
// import 'package:thirmbico/user/starching.dart';
import 'package:thirmbico/wash&fold.dart';
import 'package:thirmbico/wash&fold.dart';

import 'draweclass.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Widget? screenView;

  // bool menuOpen = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<Color> clrs = [
      Color(0xffDEFFDB),
      Color(0xfffE4DBFF),
      Color(0xffFFDADA),
      Color(0xffFFFBD9),
      Color(0xffb7b9ff),
      Color(0xffabfea3),
      Color(0xffff9999),
      Color(0xfffff7af),
      Color(0xff634c8a),
      Color(0xffb874a2),
      Color((0xff99323d)),
    ];
    return WillPopScope(onWillPop: () async{
      showExitPopup(context);
      return true;
      },

      child: Scaffold(
        // drawer: HiddenDrawerMenu(
        //   screens: _pages,
        //   backgroundColorMenu: Color(0xffedb1f7),
        // ),
        // key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //   DrawerHeader(
        //   decoration: BoxDecoration(
        //   color: Colors.blue,
        //   ),
        //   child: Text(
        //     'Drawer Header',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 24,
        //     ),
        //   ),
        // ),]),),

        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Color(0xffedb1f7)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 50.0, left: 18),
                          child: InkWell(
                            onTap: () {
                              // scale:0.6;
                              // tranx:200;
                              // trany:100;


                              // _scaffoldKey.currentState?.openDrawer();
                            },

                              child: Image.asset(
                                'assets/burhermenu.png',
                                // scale: .9,
                              ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0, top: 30),
                          child: Container(
                            child: Image.asset(
                              'assets/imgbell.png',
                              scale: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Welcome to Thirmbi.Co',
                            style: GoogleFonts.jua(
                                color: Colors.white, fontSize: 28),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Choose the laundry service',
                            style: GoogleFonts.jua(
                                color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Expanded(
                      child: Container(
                        height: height,
                        width: width,
                        margin: EdgeInsets.only(top: height * 0.018),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Container(
                                height: 130,
                                width: 345,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(width: .1),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child:
                                          Image.asset('assets/containerimg.png'),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Flat 50% Off on \n first order',
                                      style: GoogleFonts.jua(fontSize: 26),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Services',
                                      style: GoogleFonts.jua(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Consumer<MainProvider>(
                                      builder: (context,value,child) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    VeiwAllServices(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Veiw All',
                                            style: GoogleFonts.jua(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 180,
                                child: Consumer<MainProvider>(
                                    builder: (context, value, child) {
                                  return ListView.builder(
                                    itemCount: value.ServiceList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            value.getClothType();
                                            MainProvider provider =
                                                Provider.of<MainProvider>(context,
                                                    listen: false);
                                            // provider.adddata();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         WashfoldPage(name:  value.ServiceList[index]
                                                             .Servicesname,)));
                                          },
                                          child: Container(
                                            width: 130,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey)
                                              ],
                                              color: clrs[index],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 24.0),
                                                  child: Container(
                                                    height: 80,
                                                    child: Image.network(
                                                      value.ServiceList[index]
                                                          .Image,
                                                      fit: BoxFit.fill,
                                                      // scale: .9,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  value.ServiceList[index]
                                                      .Servicesname,
                                                  style: GoogleFonts.jua(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ), Text(
                                                  '₹ '+
                                                  value.ServiceList[index]
                                                      .Netprice + ' /kg',
                                                  style: GoogleFonts.jua(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    // physics: ScrollPhysics(),
                                    scrollDirection: Axis.horizontal,

                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   IroningPage()));
                                    //     },
                                    //     child: Card(
                                    //       elevation: 10,
                                    //       child: Container(
                                    //         width: 130,
                                    //         decoration: const BoxDecoration(
                                    //           color: Color(0xffe4dbff),
                                    //           borderRadius: BorderRadius.all(
                                    //             Radius.circular(20),
                                    //           ),
                                    //         ),
                                    //         child: Column(
                                    //           children: [
                                    //             Padding(
                                    //               padding: const EdgeInsets.only(
                                    //                   top: 18),
                                    //               child: Image.asset(
                                    //                 'assets/iron.png',
                                    //                 scale: 1,
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               'ironing',
                                    //               style: GoogleFonts.jua(
                                    //                   fontSize: 17,
                                    //                   fontWeight:
                                    //                       FontWeight.w500),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   DrycleanPage()));
                                    //     },
                                    //     child: Card(
                                    //       elevation: 10,
                                    //       child: Container(
                                    //         width: 130,
                                    //         decoration: const BoxDecoration(
                                    //           color: Color(0xffffd9d9),
                                    //           borderRadius: BorderRadius.all(
                                    //             Radius.circular(20),
                                    //           ),
                                    //         ),
                                    //         child: Column(
                                    //           children: [
                                    //             Padding(
                                    //               padding: const EdgeInsets.only(
                                    //                   top: 24.0),
                                    //               child: Image.asset(
                                    //                 'assets/hang drss.png',
                                    //                 scale: .9,
                                    //               ),
                                    //             ),
                                    //             const SizedBox(
                                    //               height: 15,
                                    //             ),
                                    //             Text(
                                    //               'Dry cleaning',
                                    //               style: GoogleFonts.jua(
                                    //                   fontSize: 17,
                                    //                   fontWeight:
                                    //                       FontWeight.w500),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   const StarchingPage()));
                                    //     },
                                    //     child: Card(
                                    //       elevation: 10,
                                    //       child: Container(
                                    //         width: 130,
                                    //         decoration: const BoxDecoration(
                                    //           color: Color(0xfffffbd9),
                                    //           borderRadius: BorderRadius.all(
                                    //             Radius.circular(20),
                                    //           ),
                                    //         ),
                                    //         child: Column(
                                    //           children: [
                                    //             Padding(
                                    //               padding: const EdgeInsets.only(
                                    //                   top: 24.0),
                                    //               child: Image.asset(
                                    //                 'assets/starchN.png',
                                    //                 scale: .7,
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               'starching',
                                    //               style: GoogleFonts.jua(
                                    //                   fontSize: 17,
                                    //                   fontWeight:
                                    //                       FontWeight.w500),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  );
                                }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 13),
                                child: Row(
                                  children: [
                                    Text(
                                      'Active Order',
                                      style: GoogleFonts.jua(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),

                              // Card(
                              //   elevation: 10,
                              //   child: Container(
                              //     height: 160,
                              //     width: 350,
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(20),
                              //       ),
                              //       border: Border.all(width: .1),
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         Align(
                              //           alignment: Alignment.topRight,
                              //           child: Padding(
                              //             padding: const EdgeInsets.only(
                              //                 right: 18.0, top: 12),
                              //             child: Text(
                              //               'confirmed',
                              //               style: GoogleFonts.jua(
                              //                   fontSize: 17,
                              //                   color: Color(0xffedb1f7)),
                              //             ),
                              //           ),
                              //         ),
                              //         Row(
                              //           children: [
                              //             Image.asset(
                              //               'assets/activeorderimg.png',
                              //             ),
                              //             Column(
                              //               children: [
                              //                 Text(
                              //                   'Ironing',
                              //                   style: GoogleFonts.jua(
                              //                       fontSize: 18,
                              //                       fontWeight: FontWeight.w600),
                              //                 ),
                              //                 SizedBox(
                              //                   height: 16,
                              //                 ),
                              //                 Text('order No:#123',style: GoogleFonts.jua(fontSize: 18,fontWeight: FontWeight.w600),)
                              //               ],
                              //             )
                              //           ],
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 12,
                              ),
                              Consumer<MainProvider>(
                                  builder: (context, value, child) {
                                return CarouselSlider.builder(
                                  itemCount: value.carouselimg.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: Image.asset(
                                            value.carouselimg[index]));
                                  },
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      aspectRatio: 3.0,
                                      viewportFraction: 1,
                                      enableInfiniteScroll: true,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, context) {
                                        value.currentindex;
                                        // setState(() {
                                        //   currentindex = index;
                                        // });
                                      }),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // DotsIndicator(
              //   dotsCount: items.length,
              //   position: currentindex,
              //
              // ),
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
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded,
                            size: 25, color: Color(0xff817D8F)),

                        // isDense: true,

                        // isCollapsed: true,

                        contentPadding: EdgeInsets.all(5),

                        hintText: 'Search..',

                        hintStyle: GoogleFonts.jua(
                            color: Color(0xffcdcdcd), fontSize: 19),

                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffFADEF7),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffEDB1F7)),
                        ),

                        fillColor: Colors.white,

                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> showExitPopup(BuildContext CONTXT) async {

    return await showDialog(
        context: CONTXT,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Do you want to EXIT ?",style: TextStyle(
                      fontSize:17,

                      fontFamily:'ink nut',
                      fontWeight: FontWeight.w700,
                      color: Color(0xffedb1f7))),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffedb1f7)),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700)))
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ), child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),

                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

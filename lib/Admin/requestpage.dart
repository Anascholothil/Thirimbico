import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/provider/mainprovider.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
          'Requests',
          style: GoogleFonts.jua(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body:
      SingleChildScrollView(
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),


                itemCount: value.UserDetailsList.length,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                              height: height / 4.5,
                              width: width / 1.2,
                              decoration: BoxDecoration(
                                color: Color(
                                  0xffedb1f7,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text(
                                         "Name :",
                                          style: GoogleFonts.jua(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          value.UserDetailsList[index].Name.toString(),
                                          style: GoogleFonts.jua(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                      ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Phone :",
                                          style: GoogleFonts.jua(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          value.UserDetailsList[index].Phone.toString(),
                                          style: GoogleFonts.jua(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                           SizedBox(height: 10,),
                  Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: (){
                                            value.statusApprv(value.UserDetailsList[index].id.toString(),
                                                value.UserDetailsList[index].Name.toString(),
                                                value.UserDetailsList[index].Phone.toString(),

                                                context);
                                          },
                                          child: Text(
                                            "Accept",
                                            style: GoogleFonts.jua(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 30,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: (){
                                            value.statusReject(value.UserDetailsList[index].id.toString(), context);
                                          },
                                          child: Text(
                                            "Decline",
                                            style: GoogleFonts.jua(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                  ]),
                  );
              },);
            }
          ),
        )

      // SingleChildScrollView(
      //   child: Column(
      //
      //     children: [
      //       SizedBox(height: 30,),
      //       ListView(
      //
      //         child: Container(
      //           height: height / 6,
      //           width: width / 1.2,
      //           decoration: BoxDecoration(
      //             color: Color(
      //               0xffedb1f7,
      //             ),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 18.0, top: 20),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       'Name',
      //                       style: GoogleFonts.jua(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Text(
      //                       ': Tony',
      //                       style: GoogleFonts.jua(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 18.0, top: 5),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       'Phone',
      //                       style: GoogleFonts.jua(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Text(
      //                       ': 91 7736310880',
      //                       style: GoogleFonts.jua(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Container(
      //                     height: 30,
      //                     width: width / 5,
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(
      //                         10,
      //                       ),
      //                     ),
      //                     child: Center(
      //                       child: GestureDetector(
      //                         onTap: (){},
      //                         child: Text(
      //                           "Accept",
      //                           style: GoogleFonts.jua(
      //                             fontSize: 17,
      //                             fontWeight: FontWeight.w500,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 20,
      //                   ),
      //                   Container(
      //                     height: 30,
      //                     width: width / 5,
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(
      //                         10,
      //                       ),
      //                     ),
      //                     child: Center(
      //                       child: GestureDetector(
      //                         onTap: (){},
      //                         child: Text(
      //                           "Decline",
      //                           style: GoogleFonts.jua(
      //                             fontSize: 17,
      //                             fontWeight: FontWeight.w500,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: height / 6,
      //             width: width / 1.2,
      //             decoration: BoxDecoration(
      //               color: Color(
      //                 0xffedb1f7,
      //               ),
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 20),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Name',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': Tony',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 5),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Phone',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': 91 7736310880',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Accept",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Decline",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ), SizedBox(height: 20,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: height / 6,
      //             width: width / 1.2,
      //             decoration: BoxDecoration(
      //               color: Color(
      //                 0xffedb1f7,
      //               ),
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 20),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Name',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': Tony',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 5),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Phone',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': 91 7736310880',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Accept",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Decline",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ), SizedBox(height: 20,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: height / 6,
      //             width: width / 1.2,
      //             decoration: BoxDecoration(
      //               color: Color(
      //                 0xffedb1f7,
      //               ),
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 20),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Name',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': Tony',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 5),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Phone',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': 91 7736310880',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Accept",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Decline",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ), SizedBox(height: 20,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: height / 6,
      //             width: width / 1.2,
      //             decoration: BoxDecoration(
      //               color: Color(
      //                 0xffedb1f7,
      //               ),
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 20),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Name',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': Tony',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 18.0, top: 5),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         'Phone',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         ': 91 7736310880',
      //                         style: GoogleFonts.jua(
      //                           fontSize: 22,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Accept",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Container(
      //                       height: 30,
      //                       width: width / 5,
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: Center(
      //                         child: GestureDetector(
      //                           onTap: (){},
      //                           child: Text(
      //                             "Decline",
      //                             style: GoogleFonts.jua(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}

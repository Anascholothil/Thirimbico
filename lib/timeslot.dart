import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thirmbico/homepage.dart';
import 'package:thirmbico/provider/mainprovider.dart';

import 'checkout.dart';

// import 'user/checkout.dart';

class TimeslotPage extends StatefulWidget {

   TimeslotPage({super.key,});

  @override
  State<TimeslotPage> createState() => _TimeslotPageState();
}

class _TimeslotPageState extends State<TimeslotPage> {
  int selectedIndex = -1;
  int newselectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Timeslot',
            style: GoogleFonts.jua(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10,
                  ),
                  child: Text(
                    'Pickup date',
                    style: GoogleFonts.jua(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return Container(
                height: 135,
                color: Color(0xffeeb2f7),

                // width: 150,
                child: TableCalendar(
                  firstDay: DateTime.utc(2017, 10, 16),
                  lastDay: DateTime.utc(2035, 3, 14),
                  focusedDay: value.focusDate,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onFormatChanged: (w) {
                    return;
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) =>
                        DateFormat.E(locale).format(date)[0],
                    // weekdayStyle: cWhite,
                    // weekendStyle: bold12white,
                  ),
                  calendarStyle: CalendarStyle(
                    // defaultTextStyle: bold12white,
                    defaultTextStyle: GoogleFonts.jua(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    selectedDecoration: BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                    // weekendTextStyle: TextStyle(color: Colors.green),
                    selectedTextStyle: GoogleFonts.jua(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),

                  selectedDayPredicate: (day) {
                    return isSameDay(value.selectDate, day);
                  },
                  // onPageChanged: (focusedDay) {
                  //
                  //   // No need to call setState() here
                  //
                  //
                  // },

                  calendarFormat: CalendarFormat.week,
                  onDaySelected: (selectedDay, focusedDay) {
                    // value.onDateChanged(selectedDay);
                    value.selectTime(context, selectedDay, selectedDay);
                  },
                  // Use CalendarStyle to customize the UI
                ),
              );
            }),

            // Container(
            //   height: height / 9,
            //   width: width,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //         child: Container(
            //           margin: EdgeInsets.all(10),
            //           height: 40,
            //           width: 60,
            //           decoration: BoxDecoration(
            //             // color: Colors.grey,
            //             //   color: selectedIndex==index?Color(0xffedb1f7):Colors.white,
            //             border: Border.all(
            //               width: 1,
            //               color: selectedIndex == index
            //                   ? Color(0xffedb1f7)
            //                   : Colors.black,
            //             ),
            //             borderRadius: BorderRadius.circular(
            //               8,
            //             ),
            //           ),
            //           child: SingleChildScrollView(
            //             child: Column(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 10.0),
            //                   child: Text(
            //                     'Sun',
            //                     style: GoogleFonts.jua(
            //                         fontSize: 22,
            //                         fontWeight: FontWeight.w500,
            //                         color: selectedIndex == index
            //                             ? Color(0xffedb1f7)
            //                             : Colors.black),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text(
            //                   '39',
            //                   style: GoogleFonts.jua(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.w500,
            //                       color: selectedIndex == index
            //                           ? Color(0xffedb1f7)
            //                           : Colors.black),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     itemCount: 7,
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10,
                  ),
                  child:
                      Consumer<MainProvider>(builder: (context, value, child) {
                    return InkWell(
                      onTap: () {},
                      child: Text(
                        'Pickup time',
                        style: GoogleFonts.jua(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                value.notifyListeners();

                return Container(
                  height: height/3.5,

                  decoration: BoxDecoration(

                    image: DecorationImage(image: AssetImage("assets/Vector 1.png",),),
                      color: Colors.transparent

                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/3.2,vertical: height/17),
                    child: TextFormField(

                      style: GoogleFonts.jua(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                      controller:value.timeController ,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ),
                );
              }
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: height / 1,
              width: width,
              // child: GridView.builder(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //     ),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 30,
              //       mainAxisSpacing: 30,
              //       mainAxisExtent: 50,
              //     ),
              //     itemCount: 12,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             newselectedIndex = index;
              //           });
              //         },
              //         child: Container(
              //           height: 30,
              //           width: 40,
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               width: 1,
              //               color: newselectedIndex == index
              //                   ? Color(0xffedb1f7)
              //                   : Colors.black,
              //             ),
              //             // color: Colors.black,
              //             borderRadius: BorderRadius.all(Radius.circular(15)),
              //           ),
              //           child: Center(
              //             child: Text(
              //               '9-10am',
              //               style: GoogleFonts.jua(
              //                 fontSize: 21,
              //                 fontWeight: FontWeight.w500,
              //                 color: newselectedIndex == index
              //                     ? Color(0xffedb1f7)
              //                     : Colors.black,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
            ),
          ]),
        ),
        floatingActionButton: SizedBox(
          height: 40,
          width: 120,
          child: Consumer<MainProvider>(
            builder: (context,value,child) {



              return value.timeController.text!=""?FloatingActionButton.extended(

                elevation: 10,
                backgroundColor: Color(0xffEDB1F7),
                label: Text(
                  "Checkout",
                  style: GoogleFonts.jua(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(),
                    ),
                  );
                },
              ):SizedBox();

            }


          ),
        ));
  }
}

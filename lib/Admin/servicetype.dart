import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/Admin/addservice.dart';
import 'package:thirmbico/provider/mainprovider.dart';

class LuandryAdminScreen extends StatelessWidget {
  LuandryAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> values = [
      'assets/laundry basket.png',
      'assets/iron.png',
      'assets/dry on admin.png',
      'assets/starchservice.png',
    ];
    List<Color> clrs = [
      Color(0xffDEFFDB),
      Color(0xfffE4DBFF),
      Color(0xffFFDADA),
      Color(0xffFFFBD9),
      // Color(0xffb7b9ff),
      // Color(0xffabfea3),
      // Color(0xffff9999),
      // Color(0xfffff7af),
      // Color(0xff634c8a),
      // Color(0xffb874a2),
      Color((0xff99323d)),
        Color((0xffff9999)),

    ];
    // List<String> txt = [
    //   "wash and fold",
    //   "Ironing",
    //   "Dry cleaning",
    //   "Starching",
    // ];
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
          'Laundry Services',
          style: GoogleFonts.jua(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GridView.builder(

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 30.0, // spacing between rows
                        crossAxisSpacing: 25.0,
                        // childAspectRatio: 1.11,
                        mainAxisExtent: 155,
                      ),
                      itemCount: value.ServiceList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            color: clrs[index],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(value.ServiceList[index].Image),
                                        fit: BoxFit.fill)),
                                // child: Image.asset(values[index],fit: BoxFit.fill,)
                              ),
                              // SizedBox(height: 20,),

                              Text(
                                value.ServiceList[index].Servicesname,
                                style: GoogleFonts.jua(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " ₹ " +
                                value.ServiceList[index].Netprice,
                                style: GoogleFonts.jua(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(
              onPressed: () {
                value.clearservices();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:(context) => Laundryservices(),
                  ),
                );
              },
              child:  Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0xffedb1f7),
            );
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

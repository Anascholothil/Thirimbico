import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/Admin/servicetype.dart';

import '../provider/mainprovider.dart';

class Laundryservices extends StatelessWidget {
  // String image;
  // String name;
    Laundryservices({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffedb1f7),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Luandry Services',
          style: GoogleFonts.jua(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(
          0xffedb1f7,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: height / 13,
            // ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  showBottomSheet(context);
                },
                child: Center(
                  child: value.serviceimgfile != null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          maxRadius: 100,
                          backgroundImage: FileImage(value.serviceimgfile!),
                        )
                      : Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(120)),
                          child: Icon(Icons.add),
                        ),
                ),
              );
            }),
            // SizedBox(
            //   height: height / 10,
            // ),
            SizedBox(height: height/8),
            Column(

              children: [
                Container(
                  height: height / 18,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                    color: Color(0xfff8e1fc),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Consumer<MainProvider>(builder: (context, value, child) {
                    return TextField(
                      controller: value.servicecntroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Item Name",
                        hintStyle: GoogleFonts.jua(
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jua(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }),
                ),

            SizedBox(
              height: height/20,
            ),
            Container(
              height: height / 18,
              width: width / 1.8,
              decoration: BoxDecoration(
                color: Color(0xfff8e1fc),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Consumer<MainProvider>(builder: (context, value, child) {
                return TextField(
                  // obscureText: true,
                  cursorHeight: 20,
                  cursorRadius: Radius.circular(100),
                  // showCursor: false,
                  controller: value.serviceAmontcntroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '₹',
                    hintStyle: GoogleFonts.jua(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  textAlign: TextAlign.center,

                  style: GoogleFonts.jua(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }),
            ),
            SizedBox(
              height: height/20,
            ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  value.addservice();
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LuandryAdminScreen(),
                      ));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xfff5d3fb),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: GoogleFonts.jua(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffb75dc6),
                      ),
                    ),
                  ),
                ),
              );
            }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  MainProvider laundryprovider =
      Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            // ListTile(
            //     leading:  Icon(
            //       Icons.camera_enhance_sharp,
            //       color: Color(0xffeeb2f7),
            //     ),
            //     title: const Text('Camera',),
            //     onTap: () => {laundryprovider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Color(0xffeeb2f7)),
                title: const Text(
                  'Gallery',
                ),
                onTap: () => {
                      laundryprovider.getImagegallery(),
                      Navigator.pop(context)
                    }),
          ],
        );
      });
  // ImageSource
}

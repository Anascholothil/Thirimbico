import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/provider/mainprovider.dart';

import 'clothtype.dart';

class ClothSub extends StatelessWidget {
  ClothSub({
    super.key,
  });

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

          'Cloth Type',
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
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(
              //   height: height / 13,
              // ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    showBottomSheet(context, );
                  },
                  child: Center(
                    child: value.clothtypeimgfile != null?CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      maxRadius: 100,
                      backgroundImage: FileImage(value.clothtypeimgfile!),

                    ):Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(120)),
                      child:Icon(Icons.add),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: height / 10,
              // ),
              Column(
                children: [
                  Container(
                    height: height / 18,
                    width: width / 1.3,
                    decoration: BoxDecoration(
                      color: Color(0xfff8e1fc),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: value.clothnamecntroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: GoogleFonts.jua(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                            color: Colors.white,
                        ),
                        border: InputBorder.none,


                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: height / 18,
                    width: width / 1.3,
                    decoration: BoxDecoration(
                      color: Color(0xfff8e1fc),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: value.clothpricecntroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        hintStyle: GoogleFonts.jua(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        border: InputBorder.none,


                      ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  value.addclothtype();
                  Navigator.pop(context,MaterialPageRoute(builder: (context) => ClothTypeadmin(),));

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
              )
            ],
          );
        }
      ),
    );
  }
}
void showBottomSheet(BuildContext context) {
  MainProvider laundryprovider =Provider.of<MainProvider>(context,listen: false);

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
                leading:  Icon(Icons.photo, color: Color(0xffeeb2f7)),
                title: const Text('Gallery',),
                onTap: () => {laundryprovider.clothgetImagegallery(),Navigator.pop(context)}),
          ],
        );
      });
  // ImageSource
}

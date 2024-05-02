import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/constance/callfunction.dart';
import 'package:thirmbico/provider/mainprovider.dart';
// import 'package:thirmbico/LoginScreen.dart';
import 'package:thirmbico/LoginScreen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool hidepass = false;
  void hidepassword(){
    setState(() {
      if(hidepass==true){
        hidepass=false;
      }else{
        hidepass=true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var signupwidth = MediaQuery.of(context).size.width;
    var signupheight = MediaQuery.of(context).size.height;
    return  Scaffold(

      body: Container(
        width: signupwidth,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Image.asset('assets/Thirimbi.Co2.png'),
              SizedBox(
                height: 30,
              ),
            Expanded(child: Container(decoration: BoxDecoration(color: Color(0xffedb1f7),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                ),
            ),
              child:
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 20,),
                  Text('Signup',style: GoogleFonts.jua(color: Colors.white,fontSize:28 ),),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: Consumer<MainProvider>(builder: (context, value, child) {
                      return
                        value.profilefileImage != null?
                          Center(
                          child: CircleAvatar(
                          backgroundColor:Color(0xffFADEF7),
                          radius: 70,
                          backgroundImage: FileImage(
                            value.profilefileImage!,
                          ),
                        ),
                      )
                          : value.fileimg != ""
                          ? Center(
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFADEF7),
                          radius: 70,
                          backgroundImage: NetworkImage(value.fileimg),
                        ),
                      )
                      //     :value.userphoto !=""?
                      // Center(
                      //   child: CircleAvatar(
                      //     backgroundColor: Color(0xff6F2DA8),
                      //     radius: 70,
                      //     backgroundImage: NetworkImage(value.userphoto),
                      //   ),
                      // )
                          : Center(
                        child: CircleAvatar(
                            backgroundColor: Color(0xffFADEF7),
                            radius: 70,
                            child: Icon(
                              Icons.image,
                              size: 90,
                              color: Color(0xffEDB1F7),
                            )),
                      );
                    }),
                  ),             SizedBox(height:30,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.nameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: GoogleFonts.jua(color: Color(0xff817D8F)),
                            suffixIcon: Icon(Icons.person,color: Color(0xff817D8F),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEDB1F7)),
                            ),
                            fillColor: Color(0xffFADEF7),
                            filled: true,
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return TextField(
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          controller: value.phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            hintStyle: GoogleFonts.jua(color: Color(0xff817D8F)),
                            suffixIcon: Icon(Icons.person,color: Color(0xff817D8F),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEDB1F7)),
                            ),
                            fillColor: Color(0xffFADEF7),
                            filled: true,
                          ),
                        );
                      }
                    ),


                  ),
                  SizedBox(height: 40,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Consumer<MainProvider>(
                  //     builder: (context,value,child) {
                  //       return TextField(
                  //         controller: value.passwordController,
                  //         obscureText:hidepass == true? false:true,
                  //         decoration: InputDecoration(
                  //           suffixIcon: InkWell(
                  //               onTap: () {
                  //                 hidepassword();
                  //               },
                  //               child: Icon(Icons.remove_red_eye,color: Color(0xff817D8F),)),
                  //           hintText: 'Password',
                  //           hintStyle: GoogleFonts.jua(color: Color(0xff817D8F)),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.white),
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Color(0xffEDB1F7)),
                  //           ),
                  //           fillColor: Color(0xffFADEF7),
                  //           filled: true,
                  //         ),
                  //       );
                  //     }
                  //   ),
                  // ),
                  // SizedBox(height: 40,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Consumer<MainProvider>(
                  //     builder: (context,value,child) {
                  //       return TextField(
                  //         controller: value.confirmpasswordController,
                  //         obscureText:hidepass == true? false:true,
                  //         decoration: InputDecoration(
                  //           suffixIcon: InkWell(
                  //               onTap: () {
                  //                 hidepassword();
                  //               },
                  //               child: Icon(Icons.remove_red_eye,color: Color(0xff817D8F),)),
                  //           hintText: 'confirm Password',
                  //           hintStyle: GoogleFonts.jua(color: Color(0xff817D8F)),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.white),
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Color(0xffEDB1F7)),
                  //           ),
                  //           fillColor: Color(0xffFADEF7),
                  //           filled: true,
                  //         ),
                  //       );
                  //     }
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: (){
                        value.adddata();
                        callNext(context, LoginScreen());
                     // callNext(context, LoginScreen());
                        },
                        child: Container(
                          height: 45,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Color(0xffFADEF7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text('Signup',style: GoogleFonts.jua(
                                fontSize: 20,color: Color(0xff817D8F),
                                fontWeight:FontWeight.w400)),
                          ),
                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 35.0),
                  //   child: SingleChildScrollView(
                  //     child: Row(
                  //
                  //       children: [
                  //         Image.asset('assets/Line.png'),
                  //         SizedBox(
                  //           width: 12,
                  //         ),
                  //         Text('or signup with',style: GoogleFonts.jua(color: Color(0xff817D8F),
                  //             fontSize: 16),),
                  //         SizedBox(
                  //           width: 12,
                  //         ),
                  //         Image.asset('assets/Line.png'),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: signupwidth / 5,
                        decoration:const  BoxDecoration(color: Colors.black),
                      ),
                      const  SizedBox(
                        width: 15,
                      ),
                      Text(
                        'or login with',
                        style: GoogleFonts.jua(
                            color:const  Color(
                              0xff817D8F,
                            ),
                            fontSize: 16),
                      ),
                      const   SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 1,
                        width: signupwidth/ 5,
                        decoration:const BoxDecoration(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      InkWell(
                          onTap: () {

                          },
                          child: Image.asset('assets/google.png',scale: 1.1,)),
                      SizedBox(width: 20,),
                      InkWell(child: Image.asset('assets/apple.png',scale: 1.1)),
                      SizedBox(width: 20,),
                      InkWell(
                          child: Image.asset('assets/fb.png',scale: 1.1,)),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                        style: GoogleFonts.jua(
                            color: Colors.black,fontSize: 15,
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context) => LoginScreen()));
                        },
                        child: Text('Login',style: GoogleFonts.jua(fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),

                        ),
                      ),
                    ],
                  ),
                ],),
              ),

            ),
            ),

            ],
          ),
        ),

      ),


    );
  }
}
void showBottomSheet(BuildContext context) {
  MainProvider mainProvider =Provider.of<MainProvider>(context,listen:false);
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
            ListTile(
                leading:  Icon(
                  Icons.camera_enhance_sharp,
                  color: Color(0xffEDB1F7),
                ),
                title: const Text('Camera',),
                onTap: () => {
                  mainProvider.profileImagecamera(), Navigator.pop(context)
                  }
                  ),
            ListTile(
                leading:  Icon(Icons.photo, color: Color(0xffEDB1F7)),
                title: const Text('Gallery',),
                onTap: () =>
                {
                mainProvider.profileImagegallery(),Navigator.pop(context)
                }
  ),
          ],
        );
      });
  // ImageSource
}

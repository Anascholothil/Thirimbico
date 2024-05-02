import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/Admin/Adminhome.dart';
import 'package:thirmbico/constance/callfunction.dart';
import 'package:thirmbico/homepage.dart';

import '../otpScreen.dart';
import 'mainprovider.dart';

class LoginProvider extends ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db =FirebaseFirestore.instance;
  bool otploader = false;
  String VerificationId = "";
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void sendotp(BuildContext context) async {
    otploader=true;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        otploader=false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(),
            ));
        // phoneController.clear();
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),

    );

  }


  void verify(BuildContext context) async {
    MainProvider provider =Provider.of<MainProvider>(context,listen: false);
    print("hsdvhjdvhd"+VerificationId.toString());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        userAuthorisation(user.phoneNumber, context);

      } else {
        if (kDebugMode) {
          print("6546");
        }
      }
    });
  }

  void userAuthorisation(String? phone,BuildContext context,){
    print("fkhgrhv");
    MainProvider mainProvider = Provider.of<MainProvider>(context,listen:false);

    String loginType='';
    String name='';
    String loginphone='';
    String userId='';
    String fcmid='';

    db.collection("USERS").where("PHONE_NUMBER",isEqualTo: phone).get().then((value) async {

      if(value.docs.isNotEmpty){
        for(var e in value.docs){
          print("iudhduch"+value.docs.length.toString());

          Map<dynamic, dynamic> map = e.data();

          loginType= map["TYPE"].toString();
          name= map["USER_NAME"].toString();
          loginphone= map["PHONE_NUMBER"].toString();
          userId = map["USER_ID"].toString();

          print("hhdhd"+loginphone);
          print("ssss"+loginType);
          print("iudhduch"+userId);
          print("iudhduch"+value.docs.length.toString());
          print("tftfd");
          print("sfgyf"+userId);

          if(loginType == "ADMIN"){
            print("shaneeee"+userId);
            await mainProvider.getAdminFcmId();

            FirebaseMessaging.instance.getToken().then((fcmValue) {
              db.collection("USERS").doc(userId).set(
                  {'FCM_ID': fcmValue.toString()}, SetOptions(merge: true));
              notifyListeners();
            });
            callNextReplacement(context,AdminPages());

          }else{
            mainProvider.getServices();

            print("sbdjsdbjsd"+userId.toString());
            FirebaseMessaging.instance.getToken().then((fcmValue) {
              db.collection("USERS").doc(userId).set(
                  {'FCM_ID': fcmValue.toString()}, SetOptions(merge: true));
              print("hbgfcfgvhb");
            });
            // await mainProvider.getUserFcmId();
            notifyListeners();

            callNextReplacement(context, HomeScreen());
          }


        }
      }else{
        const snackBar = SnackBar(
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 3000),
            content: Text("Sorry , You don't have any access",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }
    });
  }

}
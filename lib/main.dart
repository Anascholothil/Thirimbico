import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirmbico/checkout.dart';
import 'package:thirmbico/provider/loginProvider.dart';
import 'package:thirmbico/provider/mainprovider.dart';
import 'package:thirmbico/signup.dart';
import 'package:thirmbico/splashgradeint.dart';
import 'package:thirmbico/LoginScreen.dart';
import 'package:thirmbico/timeslot.dart';
import 'package:thirmbico/wash&fold.dart';

import 'Admin/Adminhome.dart';
import 'Admin/ColothtypeAdd.dart';
import 'Admin/orderdetails.dart';
import 'failedpage.dart';
import 'homepage.dart';
import 'homepage.dart';
import 'navigationbar.dart';
// import 'users/ironing.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>MainProvider()),
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffeeb2f7)),
          useMaterial3: true,
        ),
        // home:LoginScreen(),
        // home:SignupPage(),
        // home:IroningPage(),
        // home:WashfoldPage(),
        // home:HomeScreen(),
        home:Splashstrike(),
        // home: NavigationH
        // omeScreen(),
        // home:FailedScreen() ,
        // home: AdminPages(),
        // home: OrderDetai
        // ls(),
        // home: TimeslotPage(),
        // home: CheckoutScreen(),



        // home: ClothSub(),
      ),
    );
  }
}


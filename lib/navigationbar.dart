//
// import 'package:flutter/material.dart';
// import 'package:thirmbico/homepage.dart';
// import 'package:thirmbico/ironing.dart';
//
// import 'draweclass.dart';
// import 'homedrawer.dart';
//
// class NavigationHomeScreen extends StatefulWidget {
//   @override
//   _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
// }
//
// class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
//   Widget? screenView;
//   DrawerIndex? drawerIndex;
//
//   @override
//   void initState() {
//     drawerIndex = DrawerIndex.HOME;
//     screenView =  HomeScreen();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: SafeArea(
//         top: false,
//         bottom: false,
//         child: Scaffold(
//           backgroundColor: Colors.limeAccent,
//           body: DrawerUserController(
//             screenIndex: drawerIndex,
//             drawerWidth: MediaQuery.of(context).size.width * 0.75,
//             onDrawerCall: (DrawerIndex drawerIndexdata) {
//               changeIndex(drawerIndexdata);
//               //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
//             },
//             screenView: screenView,
//             //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
//           ),
//         ),
//       ),
//     );
//   }
//
//   void changeIndex(DrawerIndex drawerIndexdata) {
//     if (drawerIndex != drawerIndexdata) {
//       drawerIndex = drawerIndexdata;
//       switch (drawerIndex) {
//         case DrawerIndex.HOME:
//           setState(() {
//             screenView =  HomeScreen();
//           });
//           break;
//         case DrawerIndex.Help:
//           setState(() {
//             screenView = IroningPage();
//           });
//           break;
//         case DrawerIndex.FeedBack:
//           setState(() {
//             screenView = IroningPage();
//           });
//           break;
//         case DrawerIndex.Invite:
//           setState(() {
//             screenView = IroningPage();
//           });
//           break;
//         default:
//           break;
//       }
//     }
//   }
// }

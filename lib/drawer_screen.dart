// import 'package:flutter/material.dart';
//
// import 'menu_item.dart';
// // import 'package:sample_menu/menu_item.dart';
//
// class DrawerScreen extends StatefulWidget {
//   final AnimationController controller;
//
//    DrawerScreen({ required Key key, required this.controller})
//       : super(key: key);
//
//   @override
//   _DrawerScreenState createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//    Animation<double> _scaleAnimation;
//    Animation<Offset> _slideAnimation;
//
//   @override
//   Widget build(BuildContext context) {
//     if (_scaleAnimation == null) {
//       _scaleAnimation =
//           Tween<double>(begin: 0.6, end: 1).animate(widget.controller);
//     }
//     if (_slideAnimation == null) {
//       _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
//           .animate(widget.controller);
//     }
//     return SlideTransition(
//       position: _slideAnimation,
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Container(
//           color: Colors.blueAccent,
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(children: [
//             SizedBox(height: 50),
//             Row(children: [
//               CircleAvatar(),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   'Coding Tricks',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ]),
//             SizedBox(height: 30),
//             MenuItem(title: 'Home', icon: Icons.home, key: Key('home'), ),
//             MenuItem(title: 'My Account', icon: Icons.person, key: Key('Person'), ),
//             MenuItem(title: 'My Orders', icon: Icons.history,key: Key('My Order'), ),
//             MenuItem(title: 'Wishlist', icon: Icons.list,key: Key('Wishlist'), ),
//             MenuItem(
//               title: 'Settings',
//               icon: Icons.settings, key: Key('Settings'),
//             ),
//             MenuItem(title: 'Logout', icon: Icons.exit_to_app, key: Key('Logout'),)
//           ]),
//         ),
//       ),
//     );
//   }
// }

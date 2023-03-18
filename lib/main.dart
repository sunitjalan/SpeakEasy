import 'package:flutter/material.dart';
import 'package:speakeasy/login.dart';
import 'package:speakeasy/profile.dart';
import 'package:speakeasy/signup.dart';

import 'TextToVoice.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TtsScreen(),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const ResourcePage());
// }
//
// class ResourcePage extends StatelessWidget {
//   const ResourcePage({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: TabBarPage(),
//     );
//   }
// }
//
// class TabBarPage extends StatefulWidget {
//   const TabBarPage({Key? key}) : super(key: key);
//
//   @override
//   _TabBarPageState createState() => _TabBarPageState();
// }
//
// class _TabBarPageState extends State<TabBarPage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 65, 0, 10),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//             child: Column(
//               children: [
//                 const SizedBox(height: 5),
//                 Container(
//                   //height: 30,
//                   width: 300,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFFF9F9F9),
//                       borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(
//                       maxHeight: 30,
//                       maxWidth: 300,
//                     ),
//                     child: TabBar(
//
//                       unselectedLabelColor: const Color(0xFFC4C4C4),
//                       labelColor: Colors.white,
//                       indicatorWeight: 2,
//                       indicator: BoxDecoration(
//                         color: const Color(0xFF3482AF),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       controller: tabController,
//                       tabs: const [
//                         Tab(
//                           text: 'Ongoing',
//                         ),
//                         Tab(
//                           text: 'Resources',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 320,
//                   child: TabBarView(
//                     controller: tabController,
//                     children: [
//                       Container(
//                           height: 175,
//                           width: 70,
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFFFFFFF),
//                           ),
//                           child: const Center(
//                               child: Text(
//                                   'Ongoing'
//                               )
//                           )
//                       ),
//                       Container(child: const Center(child: Text('Resources')))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//}
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer.dart';
class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xCD5613).withOpacity(1),
        title: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Text(
            "SpeakEasy",
            style: GoogleFonts.stickNoBills(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Stack(
          children: [
            SafeArea(
              child: Image.asset(
                "assets/Credits_bg.png",
                fit: BoxFit.fill,
                width: 50000,
                height: 10000000,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 45, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Text(
                      "Developers",
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 100, 20, 0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 1/3*MediaQuery.of(context).size.height-80,
                        width:MediaQuery.of(context).size.width-40,
                        color: const Color(0xFFD9D9D9).withOpacity(0.2),
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          //blurs the background
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0),
                              //color: Colors.white.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white70.withOpacity(0.1),
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(4, 10, 0, 5),
                                  child: Image.asset(
                                    'assets/SJ_DP.jpg',
                                    width: (1/4)*MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SafeArea(
                                        child: Text(
                                          "Sunit Jalan",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "   200911218",
                                        style: GoogleFonts.rubik(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ), //
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                      ),
                                      Text("MIT Manipal, IT\nBatch of 2024",
                                        style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),



                                      const SizedBox(
                                        height: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 1/3*MediaQuery.of(context).size.height-80,
                        width:MediaQuery.of(context).size.width-40,
                        color: const Color(0xFFD9D9D9).withOpacity(0.2),
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          //blurs the background
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0),
                              //color: Colors.white.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white70.withOpacity(0.1),
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(4, 10, 0, 5),
                                  child: Image.asset(
                                    'assets/Radhika.jpeg',
                                    width: (1/4)*MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SafeArea(
                                        child: Text(
                                          "Radhika Mehrotra",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "   200911246",
                                        style: GoogleFonts.rubik(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ), //
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                      ),
                                      Text(
                                        "MIT Manipal, IT\nBatch of 2024",
                                        style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),



                                      const SizedBox(
                                        height: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 1/3*MediaQuery.of(context).size.height-80,
                        width:MediaQuery.of(context).size.width-40,
                        color: const Color(0xFFD9D9D9).withOpacity(0.2),
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          //blurs the background
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0),
                              //color: Colors.white.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white70.withOpacity(0.1),
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(4, 10, 0, 5),
                                  child: Image.asset(
                                    'assets/Garima.jpeg',
                                    width: (1/4)*MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SafeArea(
                                        child: Text(
                                          "Garima Kejriwal",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "   200911256",
                                        style: GoogleFonts.rubik(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ), //
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                      ),
                                      Text(
                                        "MIT Manipal, IT\nBatch of 2024",
                                        style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),



                                      const SizedBox(
                                        height: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

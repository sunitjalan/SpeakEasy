import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Uri _url = Uri.parse('');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

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
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.transparent,
        child: Stack(
          children: [
            Image.asset(
              'assets/Credits_bg.png',
              width: 5000,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 130, 24, 80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * (600 / 870),
                  color: const Color(0xFFFFFF).withOpacity(0.5),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Contact Us",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Wrap(
                              runSpacing: 0,
                              children: [
                                ListTile(
                                  leading: SvgPicture.asset(
                                    "assets/ContactUs_instagram.svg",
                                    height: 40,
                                  ),
                                  title: Text(
                                    'instagram.com/sunitjalan',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {
                                    _url = Uri.parse(
                                        'https://instagram.com/sunitjalan');
                                    _launchUrl();
                                  },
                                ),
                                ListTile(
                                  leading: SvgPicture.asset(
                                    "assets/ContactUs_linkedin.svg",
                                    height: 40,
                                  ),
                                  title: Text(
                                    'linkedin.com/sunitjalan',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {
                                    _url = Uri.parse(
                                        'https://www.linkedin.com/in/sunitjalan');
                                    _launchUrl();
                                  },
                                ),
                                ListTile(
                                  leading: SvgPicture.asset(
                                    "assets/ContactUs_gmail.svg",
                                    height: 40,
                                  ),
                                  title: Text(
                                    'sunitjalan@gmail.com',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Image.asset(
                                    "assets/ContactUs_call.png",
                                    height: 40,
                                  ),
                                  title: Text(
                                    '+91 7980676847\nSunit Jalan',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Image.asset(
                                    "assets/ContactUs_call.png",
                                    height: 40,
                                  ),
                                  title: Text(
                                    '+91 8084788905\nGarima Kejriwal',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Image.asset(
                                    "assets/ContactUs_call.png",
                                    height: 40,
                                  ),
                                  title: Text(
                                    '+91 7379747270\nRadhika Mehrotra',
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () {},
                                ),

                              ]
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
      //bottomNavigationBar: NavBar(),
    );
  }
}

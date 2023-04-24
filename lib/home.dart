import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/ScanInput.dart';
import 'package:speakeasy/TextInput.dart';
import 'package:speakeasy/VoiceInput.dart';
import 'package:speakeasy/drawer.dart';

import 'model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  late Position _currentPosition;
  bool _switchValue = false;

  Future<String> getCurrentCountry() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks[0].country ?? '';
  }

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      resizeToAvoidBottomInset: true,
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
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
                "assets/Home_bg.png",
              fit: BoxFit.fill,
              width: 50000,
              height: 10000000,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 55, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: GoogleFonts.stickNoBills(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${loggedInUser.name}",
                        style: GoogleFonts.stickNoBills(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            ElevatedButton(
                                onPressed: () async {
                                  String currentCountry = await getCurrentCountry();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Current Country'),
                                        content: Text(currentCountry),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Show gps"))
                          ],
                        ),
                      ),
                      Text(
                        "Choose how to proceed",
                        style: GoogleFonts.stick(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VoiceInput()),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width-100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Color(0xB3B3B3).withOpacity(1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                          child: Text(
                            "SPEAK",
                            style: GoogleFonts.stickNoBills(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextInput()),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width-40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Color(0xB3B3B3).withOpacity(1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                          child: Text(
                            "TYPE",
                            style: GoogleFonts.stickNoBills(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScanInput()),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width-120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Color(0xB3B3B3).withOpacity(1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                          child: Text(
                            "SCAN",
                            style: GoogleFonts.stickNoBills(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

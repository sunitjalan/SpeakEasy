import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/contactus.dart';
import 'package:speakeasy/credits.dart';
import 'package:speakeasy/home.dart';
import 'package:speakeasy/login.dart';
import 'package:speakeasy/profile.dart';

import 'model/user_model.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool _switchValue = false;

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
    final backButton = IconButton(
      alignment: Alignment.topLeft,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 40,
      ),
    );
    final header = Container(
      padding: EdgeInsets.only(
        bottom: 35,
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [

          Text(
            '${loggedInUser.name}',
            style: GoogleFonts.rubik(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),

        ],
      ),
    );
    final items = Container(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 50,
          left: 50,
          right: 50,
        ),
        child: Wrap(runSpacing: 8, children: [
          ListTile(
            leading: const Icon(
              Icons.account_box,
              color: Colors.white,
              size: 24,
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.white,
              size: 24,
            ),
            title: Text(
              'Home',
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: Text(
              'Credits',
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Colors.white, size: 24),
            title: Text(
              'Contact us',
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              );
            },
          ),
        ]));
    final button = Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(35),
          child: SizedBox(
            width: 212,
            height: 49,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xCD5613).withOpacity(1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
              ),
              child: Text(
                'Logout',
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                logout(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ),
        ),
      ),
    );

    return Container(
        width: 300,
        color: Colors.black,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  SafeArea(child: backButton),
                  Expanded(child: Container()),
                ],
              ),
              header,
              items,
              button,
            ]));
  }
  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
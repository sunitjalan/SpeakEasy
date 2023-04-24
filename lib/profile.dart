import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/home.dart';
import 'login.dart';
import 'model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return Scaffold(
      floatingActionButton: IconButton(
        alignment: Alignment.topRight,
        onPressed: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()
            ),
          );
        },
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Stack(
        children: [
          Image.asset("assets/Profile_bg.png",
          fit: BoxFit.fill,
            width: 5000,
            height: 1000000,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,",
                  style: GoogleFonts.stickNoBills(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "${loggedInUser.name}",
                    style: GoogleFonts.stickNoBills(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 135,),
                Text(
                  "Email in use:",
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    color: Color(0xCD5613).withOpacity(1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(82, 237, 237, 237),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: loggedInUser.email),
                    readOnly: true,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "xyz@email.com",
                      hintStyle: GoogleFonts.rubik(
                        color: const Color(0xFF838383),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Languages you are interested in:",
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    color: Color(0xCD5613).withOpacity(1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width -210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.grey.shade400,
                            //   width: 1.0,
                            // ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color.fromARGB(82, 237, 237, 237),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "${loggedInUser.lang1}",
                              style: GoogleFonts.rubik(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // child: TextFormField(
                        //   initialValue: "${loggedInUser.lang2}",
                        //   readOnly: true,
                        //   style: GoogleFonts.rubik(
                        //     fontSize: 16,
                        //     color: Colors.white,
                        //   ),
                        //   // autofocus: false,
                        //   //controller: _emailController,
                        //   // keyboardType: TextInputType.text,
                        //   // onSaved: (value){
                        //   //   //_emailController.text = value! ;
                        //   // },
                        //   // textInputAction: TextInputAction.next,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     fillColor: const Color.fromARGB(82, 237, 237, 237),
                        //     filled: true,
                        //     //prefixIcon: Icon(Icons.mail),
                        //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        //     hintText: "xyz@email.com",
                        //     hintStyle: GoogleFonts.rubik(
                        //       color: const Color(0xFF838383),
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        // ),
                      ),
                        SizedBox(height: 30,),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width -210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.grey.shade400,
                              //   width: 1.0,
                              // ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color.fromARGB(82, 237, 237, 237),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text(
                                "${loggedInUser.lang2}",
                                style: GoogleFonts.rubik(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // child: TextFormField(
                          //   initialValue: "${loggedInUser.lang2}",
                          //   readOnly: true,
                          //   style: GoogleFonts.rubik(
                          //     fontSize: 16,
                          //     color: Colors.white,
                          //   ),
                          //   // autofocus: false,
                          //   //controller: _emailController,
                          //   // keyboardType: TextInputType.text,
                          //   // onSaved: (value){
                          //   //   //_emailController.text = value! ;
                          //   // },
                          //   // textInputAction: TextInputAction.next,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     fillColor: const Color.fromARGB(82, 237, 237, 237),
                          //     filled: true,
                          //     //prefixIcon: Icon(Icons.mail),
                          //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          //     hintText: "xyz@email.com",
                          //     hintStyle: GoogleFonts.rubik(
                          //       color: const Color(0xFF838383),
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Text(
                              "GPS: ",
                              style: GoogleFonts.rubik(
                                fontSize: 24,
                                color: Color(0xCD5613).withOpacity(1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "${loggedInUser.gps}",
                              style: GoogleFonts.rubik(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 130, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Image.asset(
                            "assets/LogoutButton.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/home.dart';
import 'package:speakeasy/profile.dart';
import 'package:speakeasy/signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
              "assets/Login_bg.png",
            fit: BoxFit.fill,
            width: 5000,
            height: 100000,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                    child: Image.asset(
                        "assets/Login_illustration.png"
                    ),
                ),
                SizedBox(height: 100,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 340,
                      //width: MediaQuery.of(context).size.width *(2/5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        //controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value){
                          //_emailController.text = value! ;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(82, 237, 237, 237),
                          filled: true,
                          //prefixIcon: Icon(Icons.mail),
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Email",
                          hintStyle: GoogleFonts.rubik(
                            color: const Color(0xFF838383),
                            fontSize: 16,
                          ),
                          // border: InputBorder.none,
                          // focusedBorder: InputBorder.none,
                          // enabledBorder: InputBorder.none,
                          // errorBorder: InputBorder.none,
                          // disabledBorder: InputBorder.none,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 280,
                      //width: MediaQuery.of(context).size.width *(2/5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: TextFormField(

                        autofocus: false,
                        //controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value){
                          //_emailController.text = value! ;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(

                          fillColor: const Color.fromARGB(82, 237, 237, 237),
                          filled: true,
                          //prefixIcon: Icon(Icons.mail),
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Password",
                          hintStyle: GoogleFonts.rubik(
                            color: const Color(0xFF838383),
                            fontSize: 16,
                          ),
                          // border: InputBorder.none,
                          // focusedBorder: InputBorder.none,
                          // enabledBorder: InputBorder.none,
                          // errorBorder: InputBorder.none,
                          // disabledBorder: InputBorder.none,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: TextButton(
                        child: Text(
                            'New User? Sign Up!',
                          style: GoogleFonts.rubik(
                            fontSize: 22,
                            color: Colors.white,
                          ),

                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 130,),
                Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Image.asset(
                        "assets/PlayButton.png"
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  children:[
                    Expanded(child: Container()),
                    Text(
                      "SpeakEasy",
                      style: GoogleFonts.stickNoBills(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 30,),
                  ]

                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register Now',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

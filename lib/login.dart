import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/home.dart';
import 'package:speakeasy/profile.dart';
import 'package:speakeasy/signup.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _pwdController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


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
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                        child: Image.asset(
                            "assets/Login_illustration.png"
                        ),
                    ),
                    SizedBox(height: 60,),
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
                            //onChanged: (e) => _mail = e,
                            autofocus: false,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return ("Please Enter Your Email");
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                                return("Please Enter a valid email");
                              }
                              return null;
                            },
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
                            obscureText: true,
                            autofocus: false,
                            controller: _pwdController,
                            keyboardType: TextInputType.text,
                            validator: (value){
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if(value!.isEmpty){
                                return ("Password is required for login");
                              }
                              if(!regex.hasMatch(value)){
                                return ("Please Enter Valid Password(Min. 6 Character");
                              }
                            },
                            onSaved: (value){
                              _pwdController.text = value! ;
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
                        TextButton(
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
                      ],
                    ),
                    SizedBox(height: 80,),
                    Padding(
                      padding: EdgeInsets.only(left: 90),
                      child: InkWell(
                        onTap: () {

                            signIn(_emailController.text, _pwdController.text, context);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => HomeScreen()),
                          // );
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
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10,),
                      ]

                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void signIn(String email, String password, BuildContext context) async
  {
    if(_formKey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then(
              (uid) => {
            Fluttertoast.showToast(msg: "Login Successful"),
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()))}
      ).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}


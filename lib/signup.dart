import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speakeasy/home.dart';
import 'login.dart';
import 'model/user_model.dart';
import 'main.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _pwdController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();
  final _lang1Controller = new TextEditingController();
  final _lang2Controller = new TextEditingController();
  final _gpsController = new TextEditingController();
  //
  // bool _switchValue = false;

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
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
                builder: (context) => LoginScreen()
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
          Image.asset(
              "assets/SignUp_bg.png",
            fit: BoxFit.fill,
            width: 5000,
            height: 10000000,
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.stickNoBills(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                          "Name",
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          color: Color(0xCD5613).withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 270,
                        //width: MediaQuery.of(context).size.width *(2/5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          //onChanged: (e) => _user = e,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          autofocus: false,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            RegExp regex = new RegExp(r'^.{3,}$');
                            if(value!.isEmpty){
                              return ("First Name is required");
                            }
                            if(!regex.hasMatch(value)){
                              return ("Please Enter Valid Name(Min. 3 Character");
                            }
                            return null;
                          },
                          onSaved: (value){
                            _nameController.text = value! ;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(82, 237, 237, 237),
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Ram Prasad",
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
                      SizedBox(width: 20,),
                      Text(
                        "Email",
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          color: Color(0xCD5613).withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          //onChanged: (e) => _mail = e,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                            _emailController.text = value! ;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(

                            fillColor: const Color.fromARGB(82, 237, 237, 237),
                            filled: true,
                            //prefixIcon: Icon(Icons.mail),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "xyz@email.com",
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
                      SizedBox(width: 20,),
                      Text(
                        "Password",
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          color: Color(0xCD5613).withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 220,
                        //width: MediaQuery.of(context).size.width *(2/5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          //onChanged: (e) => _pwd = e,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                            hintText: "********",
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
                      SizedBox(width: 20,),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.rubik(
                          fontSize: 19,
                          color: Color(0xCD5613).withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 180,
                        //width: MediaQuery.of(context).size.width *(2/5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          //onChanged: (e) => _cpwd = e,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          autofocus: false,
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(_pwdController.text !=_confirmPasswordController.text){
                              return "Passwords don't match";
                            }
                            return null;
                          },
                          onSaved: (value){
                            _confirmPasswordController.text = value! ;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(

                            fillColor: const Color.fromARGB(82, 237, 237, 237),
                            filled: true,
                            //prefixIcon: Icon(Icons.mail),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "********",
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
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Select languages you are interested in:",
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Color(0xCD5613).withOpacity(1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 180,
                            height: 60,
                            child: DropdownButtonFormField(
                              focusColor: Color(0xCD5613).withOpacity(1),
                              dropdownColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                disabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "English",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'en',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Spanish",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'es',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "French",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'fr',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Russian",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'ru',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Hindi",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'hi',
                                ),
                              ],
                              onChanged: (value){
                                _lang1Controller.text=value! ;
                              } ,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 180,
                            height: 60,
                            child: DropdownButtonFormField(
                              focusColor: Color(0xCD5613).withOpacity(1),
                              dropdownColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                disabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "English",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'en',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Spanish",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'es',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "French",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'fr',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Russian",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'ru',
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Hindi",
                                    style: GoogleFonts.rubik(
                                      color: Color(0xCD5613).withOpacity(1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'hi',
                                ),
                              ],
                              onChanged: (value) {
                                _lang2Controller.text=value! ;
                              },
                            ),
                          ),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text(
                                "GPS",
                                style: GoogleFonts.rubik(
                                  fontSize: 24,
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Switch(
                                inactiveThumbColor: Color(0xFFFFFF).withOpacity(1),
                                inactiveTrackColor: Color(0xFFFFFF).withOpacity(1),
                                activeTrackColor: Color(0xCD5613).withOpacity(1),
                                activeColor: Color(0xCD5613).withOpacity(1),
                                value: toBoolean(_gpsController.text),
                                onChanged: (value) {
                                  setState(() {
                                    _gpsController.text = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80,right: 0,top: 100),
                        child: InkWell(
                          onTap: () {
                            signUp(_emailController.text, _pwdController.text);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => LoginScreen()),
                            // );
                          },
                          child: Image.asset(
                              "assets/PlayButton.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signUp(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value)=> {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  postDetailsToFirestore() async{

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name= _nameController.text;
    userModel.lang1=_lang1Controller.text;
    userModel.lang2=_lang2Controller.text;
    userModel.gps=_gpsController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
  }

}

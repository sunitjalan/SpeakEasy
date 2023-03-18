import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
              "assets/SignUp_bg.png",
            fit: BoxFit.fill,
            width: 5000,
            height: 10000000,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
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
              SizedBox(height: 90,),
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
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      autofocus: false,
                      //controller: _emailController,
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                        //_emailController.text = value! ;
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
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      autofocus: false,
                      //controller: _emailController,
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                        //_emailController.text = value! ;
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
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      autofocus: false,
                      //controller: _emailController,
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                        //_emailController.text = value! ;
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
                    width: 220,
                    //width: MediaQuery.of(context).size.width *(2/5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      autofocus: false,
                      //controller: _emailController,
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                        //_emailController.text = value! ;
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
                        width: 200,
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
                                "Spanish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'New York',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "French",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Los Angeles',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Russian",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Chicago',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Polish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Houston',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Hindi",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Philadelphia',
                            ),
                          ],
                          onChanged: (value) {
                            // Do something with the selected value.
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 270,
                        height: 60,
                        child: DropdownButtonFormField(
                          focusColor: Color(0xCD5613).withOpacity(1),
                          dropdownColor: Colors.black,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
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
                                "Spanish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'New York',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "French",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Los Angeles',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Russian",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Chicago',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Polish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Houston',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Hindi",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Philadelphia',
                            ),
                          ],
                          onChanged: (value) {
                            // Do something with the selected value.
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 220,
                        height: 60,
                        child: DropdownButtonFormField(
                          focusColor: Color(0xCD5613).withOpacity(1),
                          dropdownColor: Colors.black,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
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
                                "Spanish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'New York',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "French",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Los Angeles',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Russian",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Chicago',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Polish",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Houston',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Hindi",
                                style: GoogleFonts.rubik(
                                  color: Color(0xCD5613).withOpacity(1),
                                  fontSize: 16,
                                ),
                              ),
                              value: 'Philadelphia',
                            ),
                          ],
                          onChanged: (value) {
                            // Do something with the selected value.
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
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 220),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Image.asset(
                          "assets/PlayButton.png"
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

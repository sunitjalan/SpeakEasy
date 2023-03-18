import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _switchValue = false;
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
          Image.asset("assets/Profile_bg.png",
          fit: BoxFit.fill,
            width: 5000,
            height: 1000000,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
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
                  child: Text("Radhika",
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
                  width: MediaQuery.of(context).size.width -40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    // autofocus: false,
                    //controller: _emailController,
                    // keyboardType: TextInputType.text,
                    // onSaved: (value){
                    //   //_emailController.text = value! ;
                    // },
                    // textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: const Color.fromARGB(82, 237, 237, 237),
                      filled: true,
                      //prefixIcon: Icon(Icons.mail),
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
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width -250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            // autofocus: false,
                            //controller: _emailController,
                            // keyboardType: TextInputType.text,
                            // onSaved: (value){
                            //   //_emailController.text = value! ;
                            // },
                            // textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: const Color.fromARGB(82, 237, 237, 237),
                              filled: true,
                              //prefixIcon: Icon(Icons.mail),
                              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "xyz@email.com",
                              hintStyle: GoogleFonts.rubik(
                                color: const Color(0xFF838383),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width -210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            // autofocus: false,
                            //controller: _emailController,
                            // keyboardType: TextInputType.text,
                            // onSaved: (value){
                            //   //_emailController.text = value! ;
                            // },
                            // textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: const Color.fromARGB(82, 237, 237, 237),
                              filled: true,
                              //prefixIcon: Icon(Icons.mail),
                              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "xyz@email.com",
                              hintStyle: GoogleFonts.rubik(
                                color: const Color(0xFF838383),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width -200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            // autofocus: false,
                            //controller: _emailController,
                            // keyboardType: TextInputType.text,
                            // onSaved: (value){
                            //   //_emailController.text = value! ;
                            // },
                            // textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: const Color.fromARGB(82, 237, 237, 237),
                              filled: true,
                              //prefixIcon: Icon(Icons.mail),
                              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "xyz@email.com",
                              hintStyle: GoogleFonts.rubik(
                                color: const Color(0xFF838383),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
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
                        SizedBox(height: 30,),
                        ElevatedButton(
                          onPressed: (){

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xCD5613).withOpacity(1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Save Changes",
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 240, 0, 0),
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
}

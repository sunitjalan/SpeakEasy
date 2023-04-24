import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';

class ScanInput extends StatefulWidget {
  const ScanInput({Key? key}) : super(key: key);

  @override
  State<ScanInput> createState() => _ScanInputState();
}

class _ScanInputState extends State<ScanInput> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(

        shadowColor: Colors.transparent,
        backgroundColor: Color(0xCD5613).withOpacity(1),
        title: Text(
          "SpeakEasy",
          style: GoogleFonts.stickNoBills(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/TextToVoice_bg.png",
            fit: BoxFit.fill,
            height: 100000,
            width: 50000,
          ),
          Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 155,
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
                            //value: _selectedSourceLanguage,
                            onChanged: (value) {
                              // setState(() {
                              //   _selectedSourceLanguage = value!;
                              // });
                            },
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: 155,
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
                            //value: _selectedTargetLanguage,
                            onChanged: (value) {
                              // setState(() {
                              //   _selectedTargetLanguage = value!;
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20,left: 20),
                      child: Image.asset(
                        "assets/LangChange.png",
                        fit: BoxFit.fitHeight,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Center(
                  child: Image.asset(
                      "assets/Upload_illustraion.png"
                  )
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () async {

                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XCD5613).withOpacity(1),// Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Corner radius
                  ),
                ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                        "Upload JPEG",
                      style: GoogleFonts.stick(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
              ),
              SizedBox(height: 20,),
              Text("OR",
                style: GoogleFonts.stickNoBills(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XCD5613).withOpacity(1),// Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Corner radius
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Text(
                    "Upload PDF",
                    style: GoogleFonts.stick(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // Text(
              //   _recognizedText,
              //   style: GoogleFonts.rubik(
              //     color: Colors.white
              //   ),
              // ),
              //SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Container()),
                  InkWell(
                    onTap: (){

                    },
                    child: Image.asset(
                      "assets/TranslateButton.png",
                      fit: BoxFit.fitHeight,
                      height: 130,
                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

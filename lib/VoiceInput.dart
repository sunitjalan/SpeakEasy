import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'drawer.dart';

class VoiceInput extends StatefulWidget {
  const VoiceInput({Key? key}) : super(key: key);

  @override
  State<VoiceInput> createState() => _VoiceInputState();
}

class _VoiceInputState extends State<VoiceInput>
    with SingleTickerProviderStateMixin{

  String _selectedSourceLanguage = 'en';
  String _selectedTargetLanguage = 'es';
  String _sourceText = 'Hello, how are you?';
  String _translatedText = 'Hello';
  bool _isTranslating = false;
  SpeechToText speechToText=SpeechToText();
  // var _textToSpeak="";
  var text="Hold the button and start speaking";
  var islistening=false;

  late TabController tabController1;


  TextEditingController _textController=new TextEditingController();

  @override
  void initState() {
    tabController1 = TabController(length: 2, vsync: this);
    _textController.text = _sourceText;
    super.initState();
  }

  final FlutterTts flutterTts = FlutterTts();


  double _volume = 1.0;
  double _pitch = 1.0;
  double _rate = 0.5;

  Future _speak() async {
    setState(() {
      _isTranslating = true;
    });

    // Define the MyMemory API endpoint URL
    String apiUrl =
        'https://api.mymemory.translated.net/get?q=$_sourceText&langpair=$_selectedSourceLanguage|$_selectedTargetLanguage';

    // Make the API request to get the translated text
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // Parse the JSON response to get the translated text
      final decodedResponse = json.decode(response.body);
      String translatedText = decodedResponse['responseData']['translatedText'];

      // Update the translated text and reset the "isTranslating" flag
      setState(() {
        _translatedText = translatedText;
        _isTranslating = false;
      });

      await flutterTts.setLanguage(_selectedTargetLanguage);
      //await flutterTts.setLanguage('es-ES');
      //await flutterTts.setLanguage('hi-IN');
      await flutterTts.setVolume(_volume);
      await flutterTts.setPitch(_pitch);
      await flutterTts.setSpeechRate(_rate);
      await flutterTts.speak(_translatedText);
    }
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    tabController1.dispose();
    flutterTts.stop();
    super.dispose();
  }

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
            height: 1000000,
            width: 5000,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Row(
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
                              value: _selectedSourceLanguage,
                              onChanged: (value) {
                                setState(() {
                                  _selectedSourceLanguage = value!;
                                });
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
                              value: _selectedTargetLanguage,
                              onChanged: (value) {
                                setState(() {
                                  _selectedTargetLanguage = value!;
                                });
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
                  Center(
                    child: AvatarGlow(
                      endRadius: 75.0,
                      animate: islistening,
                      duration: Duration(milliseconds: 2000),
                      glowColor: Colors.orange,
                      repeat: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      showTwoGlows: true,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details) async {
                          _sourceText=text;
                          if (!islistening) {
                            var available=await speechToText.initialize();
                            if(available){
                              setState(() {
                                islistening=true;
                                speechToText.listen(
                                  localeId: _selectedSourceLanguage,
                                  onResult: (result){
                                    setState(() {
                                      text=result.recognizedWords;
                                    });
                                  },
                                );
                              });
                            }
                          }
                        },
                        onTapUp: (details){
                          _sourceText=text;
                          setState(() {
                            islistening = false;
                          });
                          speechToText.stop();
                        }
                        ,
                        child: Image.asset(
                          "assets/TranslateButton.png",
                          fit: BoxFit.fitHeight,
                          height: 100,
                        ),
                        // CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   radius: 35,
                        //   child:Icon(islistening?Icons.mic: Icons.mic_none,color: Colors.black) ,
                        // ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Press and hold to speak",
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 300,
                      ),
                      child: TabBar(

                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.black,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Color(0xCD5613).withOpacity(1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        controller: tabController1,
                        tabs: [
                          Tab(
                            child: Text(
                              " Voice\nResult",
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                              ),
                            ),
                            //text: 'Ongoing',
                          ),
                          Tab(
                            child: Text(
                              "  Text\nResult",
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                              ),
                            ),
                            //text: 'Resources',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      controller: tabController1,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Volume',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: Color(0xCD5613).withOpacity(1),
                                    ),
                                  ),
                                ),
                                Slider(
                                  activeColor: Color(0xCD5613).withOpacity(0.8),
                                  inactiveColor: Color(0xCD5613).withOpacity(0.8),
                                  thumbColor: Color(0xCD5613).withOpacity(1),
                                  value: _volume,
                                  min: 0.0,
                                  max: 1.0,
                                  onChanged: (value) {
                                    setState(() {
                                      _volume = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Pitch',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: Color(0xCD5613).withOpacity(1),
                                    ),
                                  ),
                                ),
                                Slider(
                                  activeColor: Color(0xCD5613).withOpacity(0.8),
                                  inactiveColor: Color(0xCD5613).withOpacity(0.8),
                                  thumbColor: Color(0xCD5613).withOpacity(1),
                                  value: _pitch,
                                  min: 0.0,
                                  max: 1.0,
                                  onChanged: (value) {
                                    setState(() {
                                      _pitch = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Rate',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: Color(0xCD5613).withOpacity(1),
                                    ),
                                  ),
                                ),
                                Slider(
                                  activeColor: Color(0xCD5613).withOpacity(0.8),
                                  inactiveColor: Color(0xCD5613).withOpacity(0.8),
                                  thumbColor: Color(0xCD5613).withOpacity(1),
                                  value: _rate,
                                  min: 0.0,
                                  max: 1.0,
                                  onChanged: (value) {
                                    setState(() {
                                      _rate = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: _speak,
                                      child: Image.asset(
                                        "assets/PlayButton.png",
                                        fit: BoxFit.fitHeight,
                                        height: 100,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.grey],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10,10),
                                child: Text(_translatedText,
                                  style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),

                                ),
                              ),

                              // TextFormField(
                              //   readOnly: true,
                              //   //controller: _emailController,
                              //   keyboardType: TextInputType.multiline,
                              //   minLines: 4,
                              //   maxLines: 10,
                              //   decoration: InputDecoration(
                              //       filled: true,
                              //       fillColor: Colors.white.withOpacity(0.5),
                              //       hintText: "Translated text will be displayed here",
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       )
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// class VoiceInput extends StatefulWidget {
//   const VoiceInput({Key? key}) : super(key: key);
//
//   @override
//   State<VoiceInput> createState() => _VoiceInputState();
// }
//
// class _VoiceInputState extends State<VoiceInput> {
//
//   SpeechToText speechToText=SpeechToText();
//   var text="Hold the button and start speaking";
//   var islistening=false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton:   AvatarGlow(
//         endRadius: 75.0,
//         animate: islistening,
//         duration: Duration(milliseconds: 2000),
//         glowColor: Colors.red,
//         repeat: true,
//         repeatPauseDuration: Duration(milliseconds: 100),
//         showTwoGlows: true,
//         child: GestureDetector(
//           onTapDown: (TapDownDetails details) async {
//             if (!islistening) {
//               var available=await speechToText.initialize();
//               if(available){
//                 setState(() {
//                   islistening=true;
//                   speechToText.listen(
//                     onResult: (result){
//                       setState(() {
//                         text=result.recognizedWords;
//                       });
//                     },
//                   );
//                 });
//               }
//
//             }
//           },
//
//
//           onTapUp: (details){
//             setState(() {
//               islistening = false;
//             });
//             speechToText.stop();
//           }
//           ,
//           child: CircleAvatar(
//             backgroundColor: Colors.black,
//             radius: 35,
//             child:Icon(islistening?Icons.mic: Icons.mic_none,color: Colors.white) ,
//           ),
//         ),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
//         margin: const EdgeInsets.only(bottom: 150),
//         child: Text(text,style: const TextStyle(
//           fontSize: 24,
//           color: Colors.black,
//           fontWeight: FontWeight.w600)
//         )
//       ),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'drawer.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:pdf_text/pdf_text.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;


class ScanInput extends StatefulWidget {
  const ScanInput({Key? key}) : super(key: key);

  @override
  State<ScanInput> createState() => _ScanInputState();
}

class _ScanInputState extends State<ScanInput> {


  File? _pdfFile;
  String? _text;

  String _selectedSourceLanguage = 'en';
  String _selectedTargetLanguage = 'es';
  String _sourceText = '';
  String _translatedText = '';
  bool _isTranslating = false;
  final TextEditingController _textController = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  PickedFile? _pickedImage;
  String _recognizedText = '';

  Future<void> _pickImage() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
  }
  //
  // Future<void> _recognizeText() async {
  //   if (_pickedImage == null) return;
  //
  //   final inputImage = InputImage.fromFile(File(_pickedImage!.path));
  //   final textRecognizer = GoogleMlKit.vision.textRecognizer();
  //   final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
  //
  //   setState(() {
  //     _recognizedText = recognizedText.text;
  //   });
  // }
  Future _translate() async{

    setState(() {
      _isTranslating = true;
    });

    if(_pickedImage!=null){
      _sourceText=_recognizedText.substring(0,300);
    }
    else{
      _sourceText=_sourceText.substring(0,300);
    }
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
    }
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadPDF() async {
    if (_pdfFile == null) {
      return;
    }
    String fileName = path.basename(_pdfFile!.path);
    Reference reference =
    FirebaseStorage.instance.ref().child('pdfs').child(fileName);
    UploadTask uploadTask = reference.putFile(_pdfFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String url = await taskSnapshot.ref.getDownloadURL();
    setState(() {
      _text = 'PDF file uploaded to Firebase Storage at $url';
    });
  }

  Future<void> _readPDF() async {
    if (_pdfFile == null) {
      return;
    }
    try {
      PDFDoc pdfDoc = await PDFDoc.fromFile(_pdfFile!);
      String text = await pdfDoc.text;
      setState(() {
        _sourceText = text;
      });
    } on PlatformException catch (e) {
      setState(() {
        _sourceText = 'Error: ${e.message}';
      });
    }
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
      body: SingleChildScrollView(
        child: Stack(
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
                                // DropdownMenuItem(
                                //   child: Text(
                                //     "Spanish",
                                //     style: GoogleFonts.rubik(
                                //       color: Color(0xCD5613).withOpacity(1),
                                //       fontSize: 16,
                                //     ),
                                //   ),
                                //   value: 'es',
                                // ),
                                // DropdownMenuItem(
                                //   child: Text(
                                //     "French",
                                //     style: GoogleFonts.rubik(
                                //       color: Color(0xCD5613).withOpacity(1),
                                //       fontSize: 16,
                                //     ),
                                //   ),
                                //   value: 'fr',
                                // ),
                                // DropdownMenuItem(
                                //   child: Text(
                                //     "Russian",
                                //     style: GoogleFonts.rubik(
                                //       color: Color(0xCD5613).withOpacity(1),
                                //       fontSize: 16,
                                //     ),
                                //   ),
                                //   value: 'ru',
                                // ),
                                // DropdownMenuItem(
                                //   child: Text(
                                //     "Hindi",
                                //     style: GoogleFonts.rubik(
                                //       color: Color(0xCD5613).withOpacity(1),
                                //       fontSize: 16,
                                //     ),
                                //   ),
                                //   value: 'hi',
                                // ),
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
                ),
                SizedBox(height: 30,),

                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    _pickPDF();
                    _uploadPDF();
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
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                      _readPDF();
                      _translate();
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
                      "Double Click\nTo Translate",
                      style: GoogleFonts.stick(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Container(
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
                      child: Text(
                        _translatedText ?? 'No text to display',
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          color: Colors.black,
                        ),

                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speakeasy/ScanInput.dart';
import 'package:speakeasy/TextInput.dart';
import 'package:speakeasy/VoiceInput.dart';
import 'package:speakeasy/login.dart';


import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}

//
// class TextRecognitionPage extends StatefulWidget {
//   @override
//   _TextRecognitionPageState createState() => _TextRecognitionPageState();
// }
//
// class _TextRecognitionPageState extends State<TextRecognitionPage> {
//   final ImagePicker _picker = ImagePicker();
//   PickedFile? _pickedImage;
//   String _recognizedText = '';
//
//   Future<void> _pickImage() async {
//     final pickedImage = await _picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _pickedImage = pickedImage;
//     });
//   }
//
//   Future<void> _recognizeText() async {
//     if (_pickedImage == null) return;
//
//     final inputImage = InputImage.fromFile(File(_pickedImage!.path));
//     final textRecognizer = GoogleMlKit.vision.textRecognizer();
//     final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
//
//     setState(() {
//       _recognizedText = recognizedText.text;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Recognition'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_pickedImage != null) ...[
//               Image.file(File(_pickedImage!.path)),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _recognizeText,
//                 child: Text('Recognize Text'),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 _recognizedText,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ] else ...[
//               Text('No image selected'),
//             ],
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.image),
//       ),
//     );
//   }
// }

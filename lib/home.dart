import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;





class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isRecording = false;

  void _startRecording() async {
    if (!_isRecording) {
      bool result = await _speechToText.initialize();
      if (result) {
        setState(() => _isRecording = true);
        _speechToText.listen(onResult: (result) {
          if (result.finalResult) {
            // TODO: Send the recognized text to the backend for translation
          }
        });
      }
    }
  }

  void _stopRecording() {
    if (_isRecording) {
      setState(() => _isRecording = false);
      _speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Translation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap the microphone button to start recording',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            IconButton(
              iconSize: 72.0,
              icon: Icon(_isRecording ? Icons.mic : Icons.mic_none),
              onPressed: _isRecording ? _stopRecording : _startRecording,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.language),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
          );
        },
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Languages'),
      ),
      body: Column(
          children: [
              ListTile(
              leading: Icon(Icons.mic),
              title: Text('Source Language'),
              trailing: DropdownButton<String>(
                value: 'English',
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(value: 'English', child: Text('English')),
                  DropdownMenuItem(value: 'Spanish', child: Text('Spanish')),
                  DropdownMenuItem(value: 'French', child: Text('French')),
                ],
              ),
              ),

              ListTile(
              leading: Icon(Icons.translate),
              title: Text('Target Language'),
              trailing: DropdownButton<String>(
              value: 'Spanish',
              onChanged: (value) {},
              items: [
              DropdownMenuItem(value: 'English', child: Text('English')),
              DropdownMenuItem(value: 'Spanish', child: Text('Spanish')),
              DropdownMenuItem(value: 'French', child: Text('French')),
              ],
              ),
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                child: Text('Translate'),
                onPressed: () {
                // TODO: Send the selected source and target languages to the backend
                // for translation and display the translated text on the TranslationScreen
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TranslationScreen()),
                  );
                },
                ),
              ),
          ],
      ),
    );
    }
}

class TranslationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Original Text:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Hello, how are you?',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Translated Text:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Hola, ¿cómo estás?',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class AudioVisualizer extends StatefulWidget {
//   final int lineCount;
//   final double amplitude;
//
//   const AudioVisualizer({Key? key, this.lineCount = 20, this.amplitude = 100.0})
//       : super(key: key);
//
//   @override
//   _AudioVisualizerState createState() => _AudioVisualizerState();
// }
//
// class _AudioVisualizerState extends State<AudioVisualizer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late List<double> _lineHeights;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//     )..repeat();
//     _lineHeights = List.generate(widget.lineCount, (_) => 0.0);
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _updateLineHeights(double rms) {
//     final amp = widget.amplitude;
//     final range = amp * 0.7;
//     final diff = (amp - range) / widget.lineCount;
//     final step = range / widget.lineCount;
//     final scale = rms / amp;
//     for (var i = 0; i < widget.lineCount; i++) {
//       final target = (amp - i * diff) - scale * step * i;
//       _lineHeights[i] = lerpDouble(_lineHeights[i], target, 0.1)!;
//     }
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: AudioVisualizerPainter(_lineHeights),
//       child: SizedBox.expand(
//         child: AnimatedBuilder(
//           animation: _animationController,
//           builder: (_, __) => Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Theme.of(context).primaryColor,
//                   Theme.of(context).accentColor,
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: TextButton(
//               onPressed: () {},
//               child: const Text('Tap to Play'),
//               style: TextButton.styleFrom(
//                 primary: Colors.white,
//                 textStyle: const TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AudioVisualizerPainter extends CustomPainter {
//   final List<double> lineHeights;
//   final Paint _paint = Paint()
//     ..color = Colors.white
//     ..strokeWidth = 4.0;
//
//   AudioVisualizerPainter(this.lineHeights);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final width = size.width / lineHeights.length;
//     final height = size.height;
//     for (var i = 0; i < lineHeights.length; i++) {
//       final x = i * width;
//       final y = height - lineHeights[i];
//       canvas.drawLine(Offset(x, height), Offset(x, y), _paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(AudioVisualizerPainter oldDelegate) {
//     return oldDelegate.lineHeights != lineHeights;
//   }
// }

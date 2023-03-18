
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsScreen extends StatefulWidget {
  @override
  _TtsScreenState createState() => _TtsScreenState();
}

class _TtsScreenState extends State<TtsScreen> {
  final FlutterTts flutterTts = FlutterTts();

  String _textToSpeak = '';
  double _volume = 1.0;
  double _pitch = 1.0;
  double _rate = 0.5;

  Future _speak() async {
    //await flutterTts.setLanguage('es-ES');
    await flutterTts.setLanguage('hi-IN');
    await flutterTts.setVolume(_volume);
    await flutterTts.setPitch(_pitch);
    await flutterTts.setSpeechRate(_rate);
    await flutterTts.speak(_textToSpeak);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  _textToSpeak = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter text to speak',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Volume'),
                Slider(
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
                Text('Pitch'),
                Slider(
                  value: _pitch,
                  min: 0.5,
                  max: 2.0,
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
                Text('Rate'),
                Slider(
                  value: _rate,
                  min: 0.0,
                  max: 1.5,
                  onChanged: (value) {
                    setState(() {
                      _rate = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _speak,
                  child: Text('Speak'),
                ),
                ElevatedButton(
                  onPressed: _stop,
                  child: Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AudioVisualizerPainter extends CustomPainter {
  final List<double> lineHeights;
  final Paint _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 4.0;

  AudioVisualizerPainter(this.lineHeights);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width / lineHeights.length;
    final height = size.height;
    for (var i = 0; i < lineHeights.length; i++) {
      final x = i * width;
      final y = height - lineHeights[i];
      canvas.drawLine(Offset(x, height), Offset(x, y), _paint);
    }
  }

  @override
  bool shouldRepaint(AudioVisualizerPainter oldDelegate) {
    return oldDelegate.lineHeights != lineHeights;
  }
}
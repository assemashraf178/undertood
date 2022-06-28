import 'package:deaf_mute_clinic/conversion/text_to_speech.dart';
import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../view/widget/custom_text.dart';

class ConversionPage extends StatefulWidget {
  ConversionPage({Key? key}) : super(key: key);

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech'),
        centerTitle: true,
        backgroundColor: ColorsApp.appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            const CustomText(
              text: 'Recognized words:',
              fontSise: 25,
              fontWeight: FontWeight.w900,
              color: ColorsApp.appBarColor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomText(
              text: _lastWords,
              fontSise: 20,
              fontWeight: FontWeight.bold,
              color: ColorsApp.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomText(
              text: _speechToText.isListening
                  ? ''
                  : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
              fontSise: 14,
              fontWeight: FontWeight.normal,
              color: ColorsApp.black,
            ),
            Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: TextButton(
                child: Text(
                  'Text to Speech',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.appBarColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  _speechToText.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TextToSpeechScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Icon(
            _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          ),
          backgroundColor: ColorsApp.primaryColor),
    );
  }
}

import 'package:deaf_mute_clinic/helper/theme/theme.dart';
import 'package:deaf_mute_clinic/view/widget/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechScreen extends StatelessWidget {
  final FlutterTts fluttertts = FlutterTts();

  TextToSpeechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    speak(String text) async {
      // ignore: avoid_print
      print(await fluttertts.getLanguages);
      await fluttertts.setLanguage("en-US");
      await fluttertts.setPitch(1);
      await fluttertts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech'),
        centerTitle: true,
        backgroundColor: ColorsApp.appBarColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTextField(
              controller: textEditingController,
              lableText: 'Enter text',
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              child: const Text(
                "Tap this button to speak",
                style: TextStyle(color: ColorsApp.white),
              ),
              onPressed: () => speak(textEditingController.text),
              color: ColorsApp.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

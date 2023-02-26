import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/text_to_speech_provider.dart';
import 'package:speech_assistance_app/view/widgets/text_to_speech/text_type_card.dart';

class TextReader extends StatelessWidget {
  const TextReader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TextToSpeechProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'قارئ النصوص',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: () async {
                      await provider.speechTheText();
                    },
                    icon: const Icon(
                      Icons.volume_down_alt,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: () async {
                      await provider.saveText();
                    },
                    icon: const Icon(
                      Icons.save,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: () {
                      provider.clearText();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextTypeCard(textController: provider.textToSpeechController),
        ],
      ),
    );
  }
}

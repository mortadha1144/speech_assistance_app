import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/text_to_speech_provider.dart';
import 'package:speech_assistance_app/view/widgets/text_to_speech/custom_icon_button.dart';
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
      body: Form(
        key: provider.formKey,
        autovalidateMode: provider.autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIconButton(
                    onPressed: provider.speechTheText,
                    icon: Icons.volume_down,
                  ),
                  CustomIconButton(
                    onPressed: provider.saveText,
                    icon: Icons.save,
                  ),
                  CustomIconButton(
                    onPressed: provider.clearText,
                    icon: Icons.delete,
                  ),
                  CustomIconButton(
                    onPressed: provider.test,
                    icon: Icons.delete,
                  ),
                ],
              ),
            ),
            TextTypeCard(
              textController: provider.textToSpeechController,
              onSaved: provider.onSaved,
            ),
          ],
        ),
      ),
    );
  }
}

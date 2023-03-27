import 'package:flutter/material.dart';

class TextTypeCard extends StatelessWidget {
  const TextTypeCard(
      {super.key, required this.textController, this.formKey, this.validator});

  final TextEditingController textController;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                validator: validator,
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                    hintText: 'اكتب النص هنا',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

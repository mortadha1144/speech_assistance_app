import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/providers/home_provider.dart';

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({Key? key}) : super(key: key);

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);

  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 1.0, end: 0.8)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 1.0, end: 0.3).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  Widget build(BuildContext context) {
    HomeProvider watchProvider = context.watch<HomeProvider>();
    HomeProvider raedProvider = context.read<HomeProvider>();
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8.5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        _controller
                            .forward()
                            .then((value) => _controller.reverse());
                        context.read<HomeProvider>().insertIntoDatabase();
                      },
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: watchProvider.lengthOfAddedTextList,
                          itemBuilder: (context, index) => ScaleTransition(
                            alignment: Alignment.centerRight,
                            scale: _scaleAnimation,
                            child: PressedText(
                                text: watchProvider.addedText[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        onPressed: () {},
                        child: const Icon(
                          Icons.backspace_rounded,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonForTapBar(
                        onPressed: () => watchProvider.speechTextInTexField(),
                        text: 'تحدث',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButtonForTapBar(
                        onPressed: () => watchProvider.addTextToSpeech(),
                        text: 'إضافة',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButtonForTapBar(
                        onPressed: () => watchProvider.deleteTextToSpeech(),
                        text: 'حذف',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButtonForTapBar(
                        onPressed: () => watchProvider.testOnDatabase(),
                        text: 'test',
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButtonForTapBar(
                  onPressed: () => watchProvider.showCellsRecord(context),
                  text: 'الرئيسية',
                  icon: Icons.chevron_right,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller:
                    context.watch<HomeProvider>().textToSpeechController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                  hintText: 'اكتب النص هنا',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

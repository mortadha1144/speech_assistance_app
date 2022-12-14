import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

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
                        context.read<HomeProvider>().speakList();
                      },
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: AnimatedList(
                          controller:
                              context.watch<HomeProvider>().scrollController,
                          key: context.read<HomeProvider>().key,
                          scrollDirection: Axis.horizontal,
                          initialItemCount:
                              watchProvider.homePagesController.initialPage == 0
                                  ? watchProvider.addedText.length
                                  : watchProvider.lengthOfCellsList,
                          itemBuilder: (context, index, animation) {
                            return ScaleTransition(
                              alignment: Alignment.centerRight,
                              scale: animation,
                              child: ScaleTransition(
                                alignment: Alignment.centerRight,
                                scale: _scaleAnimation,
                                child: watchProvider
                                            .homePagesController.initialPage ==
                                        0
                                    ? PressedText(
                                        text: watchProvider
                                            .addedText[index])
                                    : PressedCell(
                                        text: context
                                            .watch<HomeProvider>()
                                            .tapedCells[index]
                                            .name,
                                        imagePath: context
                                            .watch<HomeProvider>()
                                            .tapedCells[index]
                                            .image,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        onPressed: () =>
                            context.read<HomeProvider>().onPressedBackspace(),
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
          Expanded(
            child: PageView(
              controller: context.watch<HomeProvider>().homePagesController,
              children: watchProvider.homePages,
            ),
          ),
        ],
      ),
    );
  }
}

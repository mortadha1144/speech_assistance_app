import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/view/widgets/home/pressed_cell.dart';

class CustomPlayBar extends StatefulWidget {
  const CustomPlayBar({super.key});

  @override
  State<CustomPlayBar> createState() => _CustomPlayBarState();
}

class _CustomPlayBarState extends State<CustomPlayBar> with TickerProviderStateMixin{
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
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Container(
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
                          provider.onTapPlayBar(
                              text: provider.strOfNames);
                        },
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: AnimatedList(
                            controller: provider.scrollController,
                            key: provider.key,
                            scrollDirection: Axis.horizontal,
                            initialItemCount: provider.lengthOfCellsList,
                            itemBuilder: (context, index, animation) {
                              return ScaleTransition(
                                alignment: Alignment.centerRight,
                                scale: animation,
                                child: ScaleTransition(
                                  alignment: Alignment.centerRight,
                                  scale: _scaleAnimation,
                                  child: PressedCell(
                                    text: provider.tapedCells[index].name,
                                    imagePath:
                                        provider.tapedCells[index].image,
                                    width: MediaQuery.of(context).size.width / 6,
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
                          onPressed: () => provider.onPressedBackspace(),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/view/widgets/home/pressed_cell.dart';

class CustomPlayBar extends StatefulWidget {
  const CustomPlayBar({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<CustomPlayBar> createState() => _CustomPlayBarState();
}

class _CustomPlayBarState extends State<CustomPlayBar>
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
                  onTap: () async {
                    await _controller
                        .forward()
                        .then((_) => _controller.reverse());
                    await _scrollToTop(provider.tapedCells);
                    await provider.onTapPlayBar(text: provider.strOfNames);
                    await _scrollToBottom(provider.tapedCells);
                  },
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: AnimatedList(
                      controller: widget.scrollController,
                      key: provider.key,
                      padding: EdgeInsets.zero,
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
                              imagePath: provider.tapedCells[index].image,
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
                  child: GestureDetector(
                    onTapDown: provider.onBackSpaceTapDown,
                    onTapUp: provider.onBackSpaceTapUpp,
                    //onTapCancel: provider.onBackSpaceTapCancel,
                    onTap: provider.onPressedBackspace,
                    onLongPressStart: provider.onLongPressBackspaceStart,
                    onLongPressEnd: provider.onLongPressBackspaceEnd,
                    // child: CupertinoButton(

                    //   padding: const EdgeInsets.symmetric(horizontal: 2),
                    //   onPressed: provider.onPressedBackspace,
                    //   child: const Icon(
                    //     Icons.backspace_rounded,
                    //     color: Colors.black,
                    //     size: 40,
                    //   ),
                    // ),
                    child: Icon(
                      Icons.backspace_rounded,
                      color: provider.isBackSpaceTappedDown
                          ? Colors.black.withOpacity(0.4)
                          : Colors.black,
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

  Future<void> _scrollToTop(List<Cell> tapedCells) async {
    if (tapedCells.length > 5) {
      await widget.scrollController.animateTo(
        widget.scrollController.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  Future<void> _scrollToBottom(
    List<Cell> tapedCells,
  ) async {
    if (tapedCells.length > 5) {
      await Future.delayed(
        const Duration(seconds: 2),
        () async {
          int duration = (tapedCells.length * 0.3).round();
          await widget.scrollController.animateTo(
            widget.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: Duration(seconds: duration),
          );
        },
      );
    }
  }
}

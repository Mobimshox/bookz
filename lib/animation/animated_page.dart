import 'package:flutter/cupertino.dart';

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallBack = void Function(int index);

class AnimatedPage extends StatelessWidget {
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pageCount;
  final OnPageChangeCallBack onChanged;

  const AnimatedPage(
      {super.key,
        required this.pageController,
        required this.pageValue,
        required this.child,
        required this.pageCount,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onChanged,
      physics: const ClampingScrollPhysics(),
      controller: pageController,
      itemCount: pageCount,
      itemBuilder: (context, index) {
        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(0.0, -50 * (index - pageValue)),
            child: child(index, context),
          );
        } else if(index == pageValue.floor() || index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(0.0, 50 * (index - pageValue)),
            child: child(index, context),
          );
        } else {
          return child(index, context);
        }
        return child(index, context);
      },
    );
  }
}

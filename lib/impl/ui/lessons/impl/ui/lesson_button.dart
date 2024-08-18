import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walley/util/navigation_util.dart';

enum LessonButtonColor { red, white }

class LessonButton extends StatelessWidget {
  final LessonButtonColor color;
  final Icon? icon;
  final double? top, bottom, left, right;
  final Widget? destination;
  LessonButton({
    super.key,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.icon,
    this.destination,
  });

  final whiteButton = SvgPicture.asset(
    'assets/lesson_white_button.svg',
    semanticsLabel: 'White button',
  );

  final redButton = SvgPicture.asset(
    'assets/lesson_red_button.svg',
    semanticsLabel: 'Red button',
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          if (destination != null) {
            NavigationUtil.navigateTo(destination!, context);
          }
        },
        child: SizedBox(
          height: 65,
          width: 60,
          child: Stack(
            clipBehavior: Clip
                .none, // Ensure items placed on top of each other are still shown
            children: [
              const SizedBox.shrink(),
              Positioned(
                top: top,
                bottom: bottom,
                left: left,
                right: right,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: getButtonAsset(),
                ),
              ),
              icon == null
                  ? const SizedBox
                      .shrink() // Display empty widget if no icon is configured
                  : Positioned(
                      top: top,
                      bottom: bottom,
                      left: left,
                      right: right,
                      child: SizedBox(
                        width: 60,
                        height: 55,
                        child: Center(
                          child: Icon(
                            icon!.icon,
                            color: color == LessonButtonColor.white
                                ? const Color.fromARGB(100, 100, 100, 100)
                                : Colors.white,
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

  SvgPicture getButtonAsset() {
    switch (color) {
      case LessonButtonColor.red:
        return redButton;
      default:
        return whiteButton;
    }
  }
}

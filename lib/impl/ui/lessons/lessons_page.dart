import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:walley/impl/ui/abstract_walley_page.dart';
import 'package:walley/impl/ui/lessons/impl/lessons/unit1_lesson2.dart';
import 'package:walley/impl/ui/lessons/impl/ui/lesson_button.dart';
import 'package:walley/impl/ui/lessons/impl/lessons/unit1_lesson1.dart';

class LessonsPage extends StatefulWidget implements AbstractWalleyPage {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();

  @override
  String getName() => "Lessons";
}

class _LessonsPageState extends State<LessonsPage> {
  final whiteButton = SvgPicture.asset(
    'assets/lesson_white_button.svg',
    semanticsLabel: 'White button',
  );

  final redButton = SvgPicture.asset(
    'assets/lesson_red_button.svg',
    semanticsLabel: 'White button',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 223, 103, 103),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UNIT 1",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 220, 208, 208),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Econ 101",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 100, 43, 43),
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 100, 43, 43),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Icon(
                    Iconsax.book_1,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          LessonButton(
            color: LessonButtonColor.red,
            icon: const Icon(Icons.flag_rounded),
            destination: const Unit1Lesson1(),
          ),
          LessonButton(
            color: LessonButtonColor.white,
            left: 20,
            icon: const Icon(Icons.attach_money_rounded),
            destination: const Unit1Lesson2(),
          ),
          LessonButton(color: LessonButtonColor.white, left: 40),
          LessonButton(color: LessonButtonColor.white, left: 30),
          LessonButton(color: LessonButtonColor.white, left: 10),
          LessonButton(color: LessonButtonColor.white, left: 25),
          const Placeholder(),
        ],
      ),
    );
  }
}

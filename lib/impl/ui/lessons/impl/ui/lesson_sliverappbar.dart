import 'package:flutter/material.dart';
import 'dart:math';

import 'package:walley/impl/ui/lessons/impl/lesson.dart';

class LessonSliverAppBar extends StatelessWidget {
  final String? imageUrl;
  final Lesson lesson;
  const LessonSliverAppBar({
    super.key,
    this.imageUrl,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        double scrollProgress = (min(constraints.scrollOffset, 150) / 150);
        Color appBarColor = const Color.fromARGB(255, 201, 146, 142);
        int backButtonColor = ((1 - scrollProgress) * 255).toInt();
        return SliverAppBar(
          backgroundColor: appBarColor,
          expandedHeight: 300,
          pinned: true,
          stretch: true,
          title: Opacity(
            opacity: scrollProgress,
            child: Text("Lesson ${lesson.lessonNumber()}"),
          ),
          iconTheme: IconThemeData(
            color: Color.fromARGB(
              255,
              backButtonColor,
              backButtonColor,
              backButtonColor,
            ),
          ),
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: imageUrl == null
                ? null
                : BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl!),
                      opacity: 1 - scrollProgress,
                      fit: BoxFit.cover,
                    ),
                  ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        appBarColor
                            .withAlpha(((1 - scrollProgress) * 255).toInt()),
                        Colors.transparent,
                      ],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.center,
                    ),
                  ),
                ),
                Padding(
                  padding: scrollProgress == 1
                      ? const EdgeInsets.only()
                      : const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "UNIT ${lesson.unitNumber()}: LESSON ${lesson.lessonNumber()}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        lesson.lessonName(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        lesson.lessonDescription(),
                        style: const TextStyle(height: 0, color: Colors.white),
                      ),
                    ]
                        .map(
                          (widget) => Opacity(
                            opacity: 1 -
                                scrollProgress, // off = 0 -> opa = 1; off = 100; opa = 0
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: widget,
                            ),
                          ),
                        ) // Align all widget to center left
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

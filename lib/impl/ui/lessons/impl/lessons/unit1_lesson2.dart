import 'package:flutter/material.dart';
import 'package:walley/impl/ui/lessons/impl/lesson.dart';
import 'package:walley/impl/ui/lessons/impl/ui/lesson_sliverappbar.dart';

class Unit1Lesson2 extends StatelessWidget implements Lesson {
  const Unit1Lesson2({super.key});

  @override
  int lessonNumber() => 2;

  @override
  int unitNumber() => 1;

  @override
  String lessonName() => "Opportunity Cost & PPC";

  @override
  lessonDescription() =>
      "Understand key concepts, terms, and graphs related to opportunity cost and the production possibilities curve.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LessonSliverAppBar(
            lesson: this,
            imageUrl:
                "https://images.unsplash.com/photo-1593672715438-d88a70629abe?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Production Possibilities Curve (PPC) or Production Possibilities Frontier, is a graphical model used to illustrate the opportunity costs and tradeoffs involved in resource allocation within producing 2 goods. The PPC would show whether it has increasing, constant or decreasing opportunity costs and how the resources are used to produce these products.  The PPC model can also be used to show how economic growth is reflected by a shift in the curve itself. The bowed-out shape of the PPC indicates that there are increasing opportunity costs of production, bowed-in is decreasing and a straight line is constant opportunity cost.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Placeholder(),
                  const Text(
                    "Points inside the PPC are inefficient, points on the PPC are efficient, and points above the PPC are unattainable.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Placeholder(),
                  const Text(
                    "The opportunity cost of moving from one efficient combination of production to another efficient combination of production is how much of one good is given up to get more of the other good. To calculate the opportunity cost (find the opportunity cost of good X in terms of the units of Y given up), we use this formula: \n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Opportunity cost of each unit of good X = (Y1 - Y2) / (X1 - X2) units of good Y\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Let’s do an example:\n",
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      children: [
                        const TableRow(
                          children: [
                            Text('Number of doughnuts'),
                            Text('Number of baguettes'),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Text('0'),
                            Text('5'),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Text('2'),
                            Text('4'),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Text('4'),
                            Text('3'),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Text('6'),
                            Text('2'),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Text('8'),
                            Text('1'),
                          ],
                        ),
                      ]
                          .map(
                            (tableRow) => tableRow = TableRow(
                              children: tableRow.children.map((text) {
                                if (text is Text) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: text,
                                  );
                                } else {
                                  return text;
                                }
                              }).toList(),
                            ),
                          ) // Add padding to all text widgets inside table
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity, // expand all width
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 201, 146, 142),
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Mini quiz",
                        style: TextStyle(
                          color: Color.fromARGB(255, 201, 146, 142),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

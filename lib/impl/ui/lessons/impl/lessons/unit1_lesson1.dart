import 'package:flutter/material.dart';
import 'package:walley/impl/ui/lessons/impl/lesson.dart';
import 'package:walley/impl/ui/lessons/impl/ui/lesson_sliverappbar.dart';

class Unit1Lesson1 extends StatelessWidget implements Lesson {
  @override
  int lessonNumber() => 1;

  @override
  int unitNumber() => 1;

  @override
  String lessonName() => "Introduction to Economics";

  @override
  lessonDescription() => "Begin with the basics";

  const Unit1Lesson1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LessonSliverAppBar(
            lesson: this,
            imageUrl:
                "https://images.unsplash.com/photo-1518458028785-8fbcd101ebb9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The ultimate economic problem is that our wants are unlimited and resources are limited, making them scarce.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Therefore, the field of economics is dedicated to studying how a society manages its scarce resources to fulfil the needs and wants of its people—efficient use of scarce resources to achieve the maximum satisfaction of economic wants.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Since there is not enough resources to produce all the goods and services that people want (Scarcity), we must decide what we will have and what we must forgo (Choices).\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Opportunity cost",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "The opportunity cost of an item is what you give up to obtain that item. It is the next best alternative forgone.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "Economists seek solutions by addressing these 3 basic questions:\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "1. What to produce?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "What types of goods and services does society choose to produce?\n",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "2. How to produce?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "What sort of technology can be used to produce the goods and services?\n",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "3. For whom to produce?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "How are the goods and services distributed among people?\n",
                    ),
                  ),
                  const Text(
                    "An economic system is a system where societies or governments produce and allocate available products, services, and resources over a nation or geographic area. Economic systems differ as to:\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "- Who owns the factors of production (Lands, Labour, Capital, Entrepreneurship).\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "- The method used to coordinate and direct economic activities.\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.justify,
                    "Let's look at some examples:\n",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "- Market economy: the private ownership of resources and the use of market and prices to coordinate and direct economic activities.\n",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "- Command economy: resources are owned by the government and economic decision making occurs through a central economic plan.\n",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "- Mixed economy: the combination of features of market and command economies. The government and the private sector jointly solve economic problems.\n",
                    ),
                  ),
                  const Text(
                    "Economists use models to simplify, analyze, and predict human behavior. How sensitive to price consumers are with a good (Elasticity), supply and demand graphs,... Models simplify and single out external details to allow us to see what is truly important - showing relationships among economic variables. Models include graphs and mathematical models.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    "In their use of models, economists usually make the assumption, when analyzing the effect of a particular change on a market or on a nation’s economy, that all else is held constant. The term we use for “all else equal” is the Latin expression, ceteris paribus.\n",
                    textAlign: TextAlign.justify,
                  ),
                  const Text(
                    textAlign: TextAlign.justify,
                    "We can use either positive or normative analysis when thinking about economic problems. Positive analysis is objective, fact-based, and cause-and-effect thinking about problems. When economists disagree it is typically due to different normative analysis. When using normative analysis, the focus is on what should happen or how desirable one action is compared to a different action.\n",
                  ),
                  const Text(
                    textAlign: TextAlign.justify,
                    "The study of economics is sometimes broken down into two disciplines:\n",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Microeconomics",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Studies the behaviour of individual economic units such as consumers, firms, investors, and workers ... as well as individual markets.\n",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Macroeconomics",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Studies the aggregate behavior of the economy. Macroeconomics seeks to obtain an overview or general outline of the economy's structure and the relationships of its major aggregates.\n",
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

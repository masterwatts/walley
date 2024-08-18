import 'package:flutter/material.dart';
import 'package:walley/impl/ui/root/walley_app_bar.dart';
import 'package:walley/impl/ui/root/walley_navigation_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WalleyNavigationBar walleyNavigationBar = WalleyNavigationBar(
      _currentIndex,
      onTabChange: (index) => setState(
        () {
          _currentIndex = index;
        },
      ),
    );

    return Scaffold(
      body: Center(child: walleyNavigationBar.getScreen() as Widget),
      bottomNavigationBar: walleyNavigationBar,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: WalleyAppBar(
          walleyNavigationBar: walleyNavigationBar,
        ),
      ),
    );
  }
}

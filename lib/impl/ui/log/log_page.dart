import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:walley/impl/ui/abstract_walley_page.dart';
import 'package:walley/impl/ui/log/impl/deposit_tab.dart';
import 'package:walley/impl/ui/log/impl/expend_tab.dart';

class LogPage extends StatefulWidget implements AbstractWalleyPage {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();

  @override
  String getName() => "Log";
}

class _LogPageState extends State<LogPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: at option to change date and time of entry
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          shape: const CircleBorder(),
          child: const Icon(Iconsax.scanner),
        ),
        appBar: const TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.minus),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Expend",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.add),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Deposit",
                  ),
                ],
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            ExpendTab(),
            DepositTab(),
          ],
        ),
      ),
    );
  }
}

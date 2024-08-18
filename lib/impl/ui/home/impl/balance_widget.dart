import 'package:flutter/material.dart';
import 'package:walley/util/finance_util.dart';
import 'package:walley/util/user_util.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  String _lastBalanceData = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Balance",
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            FutureBuilder(
              future: UserUtil.readOrCreateFieldFromStream("balance", 0),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasError ||
                    snapshot.connectionState != ConnectionState.done ||
                    snapshot.data == null) {
                  // When data has not yet loaded, use previously loaded data
                  return Expanded(
                    flex: 10,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "$_lastBalanceData₫",
                        style: const TextStyle(
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  );
                }

                if (snapshot.data == 0) {
                  return const Text(
                    "Empty",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      height: 0,
                    ),
                  );
                }

                _lastBalanceData = FinanceUtil.vnd.format(snapshot.data);
                return Expanded(
                  flex: 10,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "$_lastBalanceData₫",
                      style: const TextStyle(
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 1,
            ),
            FutureBuilder(
              future: UserUtil.readOrCreateFieldFromStream("savings", 0),
              builder: (_, AsyncSnapshot snapshot) => Expanded(
                flex: 4,
                child: FittedBox(
                  child: Text(
                    (snapshot.connectionState == ConnectionState.done)
                        ? snapshot.data == 0 // Empty savings
                            ? "Your savings are empty"
                            : "${FinanceUtil.vnd.format(snapshot.data)}₫ currently in savings" // Savings available
                        : "Loading...", // Data not yet loaded
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Theme.of(context).hintColor.withAlpha(120),
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ), // Empty expanded widget to proportionate balance number widget
          ],
        ),
      ),
    );
  }
}

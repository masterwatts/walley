import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:walley/util/sound_util.dart';
import 'package:walley/util/user_util.dart';

class LogAnimation extends StatefulWidget {
  final String category, notes;
  final int? moneyAmount;
  const LogAnimation({
    super.key,
    required this.category,
    required this.notes,
    required this.moneyAmount,
  });

  @override
  State<LogAnimation> createState() => _LogAnimationState();
}

class _LogAnimationState extends State<LogAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _tickOpacityAnimationController,
      _opacityBackgroundAnimationController,
      _visualsSlideInAnimationController;
  late final Animation<double> _tickOpacityAnimation,
      _opacityBackgroundAnimation,
      _visualsSlideInAnimation;

  @override
  void initState() {
    _tickOpacityAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _tickOpacityAnimation =
        Tween(begin: .0, end: 1.0).animate(_tickOpacityAnimationController);

    _opacityBackgroundAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityBackgroundAnimation = Tween(begin: 0.0, end: 0.5)
        .animate(_opacityBackgroundAnimationController);
    _opacityBackgroundAnimationController.forward();

    _visualsSlideInAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _visualsSlideInAnimation = Tween(begin: -400.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _visualsSlideInAnimationController,
        curve: _visualsSlideInAnimationController.lastElapsedDuration != null
            ? Curves.easeInExpo
            : Curves.easeOutExpo,
      ),
    );
    _visualsSlideInAnimationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserUtil.modifyJsonDocument(
        "spendingHistory",
        (Map<String, dynamic> currentData) {
          currentData[DateTime.now().toString()] = {
            "type": "expend",
            "amount": widget.moneyAmount.toString(),
            "category": widget.category,
            "notes": widget.notes,
          };
          return currentData;
        },
      ),
      builder: (_, newEntry) => FutureBuilder(
        future: UserUtil.modifyBalance(
          -widget.moneyAmount!,
        ),
        builder: (_, balanceModification) {
          bool isConnectionPending =
              (newEntry.connectionState != ConnectionState.done ||
                  balanceModification.connectionState != ConnectionState.done);

          return AnimatedBuilder(
            animation: _opacityBackgroundAnimationController,
            builder: (context, child) {
              return Material(
                type: MaterialType.canvas,
                color: Colors.black.withOpacity(
                  _opacityBackgroundAnimation.value,
                ), // max opacity = 0.5
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _visualsSlideInAnimationController.duration =
                            const Duration(milliseconds: 250);
                        _visualsSlideInAnimationController.reverse();
                        _opacityBackgroundAnimationController.reverse();
                        Navigator.pop(context);
                      },
                    ),
                    AnimatedBuilder(
                      animation: _visualsSlideInAnimationController,
                      builder: (
                        context,
                        child,
                      ) =>
                          Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            bottom: _visualsSlideInAnimation.value,
                            child: Container(
                              height: 280,
                              width: MediaQuery.of(
                                context,
                              ).size.width,
                              color: Theme.of(
                                context,
                              ).colorScheme.surface,
                            ),
                          ),
                          Positioned(
                            bottom: 200 + _visualsSlideInAnimation.value,
                            child: Text(
                              isConnectionPending ? "Processing" : "Done",
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100 + _visualsSlideInAnimation.value,
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: AnimatedBuilder(
                                animation: _tickOpacityAnimationController,
                                builder: (
                                  context,
                                  child,
                                ) {
                                  if (!isConnectionPending) {
                                    // animation done
                                    _tickOpacityAnimationController.forward();
                                    Future.delayed(
                                      const Duration(milliseconds: 250),
                                    ).then((_) {
                                      SoundUtil.playTransactionComplete();
                                      HapticFeedback.mediumImpact();
                                    });
                                  }
                                  return Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Opacity(
                                          opacity:
                                              1 - _tickOpacityAnimation.value,
                                          child:
                                              const CircularProgressIndicator(
                                            strokeWidth: 4,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: _tickOpacityAnimationController
                                            .value,
                                        child: MSHCheckbox(
                                          size: 60,
                                          value: _tickOpacityAnimationController
                                                  .value ==
                                              1,
                                          colorConfig: MSHColorConfig
                                              .fromCheckedUncheckedDisabled(
                                            checkedColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          style: MSHCheckboxStyle.stroke,
                                          onChanged: (selected) {},
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tickOpacityAnimationController.dispose();
    _opacityBackgroundAnimationController.dispose();
    _visualsSlideInAnimationController.dispose();
    super.dispose();
  }
}

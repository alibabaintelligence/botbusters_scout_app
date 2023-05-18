import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

enum AutoPosition {
  positionOne,
  positionTwo,
  positionThree,
  positionFour,
}

class AutoPositionWidget extends StatefulWidget {
  const AutoPositionWidget({
    super.key,
    required this.autoPosition,
    required this.onButtonPressed,
  });

  final AutoPosition autoPosition;
  final void Function(AutoPosition) onButtonPressed;

  @override
  State<AutoPositionWidget> createState() => _AutoPositionWidgetState();
}

class _AutoPositionWidgetState extends State<AutoPositionWidget> {
  late AutoPosition autoPosition = widget.autoPosition;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    height: 300.0,
                    fit: BoxFit.fitHeight,
                    'assets/imgs/field.png',
                  ),
                ),
              ],
            ),
            Positioned(
              top: 250.0,
              left: 75.0 + 30.0 + 25.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        autoPosition = AutoPosition.positionFour;
                        widget.onButtonPressed(autoPosition);
                      });
                    },
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    child: autoPosition == AutoPosition.positionFour
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent.shade100
                                      .withOpacity(0.5),
                                  blurRadius: 10.0,
                                  offset: const Offset(2.0, 0.0),
                                )
                              ],
                            ),
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            child: autoPosition == AutoPosition.positionFour
                                ? const Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  )
                                : null,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 125.0,
              left: 75.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        autoPosition = AutoPosition.positionOne;
                        widget.onButtonPressed(autoPosition);
                      });
                    },
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    child: autoPosition == AutoPosition.positionOne
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent.shade100
                                      .withOpacity(0.5),
                                  blurRadius: 10.0,
                                  offset: const Offset(2.0, 0.0),
                                )
                              ],
                            ),
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            child: autoPosition == AutoPosition.positionOne
                                ? const Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  )
                                : null,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        autoPosition = AutoPosition.positionTwo;
                        widget.onButtonPressed(autoPosition);
                      });
                    },
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    child: autoPosition == AutoPosition.positionTwo
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent.shade100
                                      .withOpacity(0.5),
                                  blurRadius: 10.0,
                                  offset: const Offset(2.0, 0.0),
                                )
                              ],
                            ),
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            child: autoPosition == AutoPosition.positionTwo
                                ? const Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  )
                                : null,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        autoPosition = AutoPosition.positionThree;
                        widget.onButtonPressed(autoPosition);
                      });
                    },
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    child: autoPosition == AutoPosition.positionThree
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent.shade100
                                      .withOpacity(0.5),
                                  blurRadius: 10.0,
                                  offset: const Offset(2.0, 0.0),
                                )
                              ],
                            ),
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            child: autoPosition == AutoPosition.positionThree
                                ? const Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  )
                                : null,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

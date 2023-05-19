import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class SubstationWidget extends StatefulWidget {
  const SubstationWidget({
    super.key,
    required this.takingMoreFromDoubleSubstation,
    required this.onButtonPressed,
  });

  final bool takingMoreFromDoubleSubstation;
  final void Function(bool) onButtonPressed;

  @override
  State<SubstationWidget> createState() => _SubstationWidgetState();
}

class _SubstationWidgetState extends State<SubstationWidget> {
  late bool takingMoreFromDoubleSubstation =
      widget.takingMoreFromDoubleSubstation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 80.0),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      takingMoreFromDoubleSubstation = true;
                      widget.onButtonPressed(takingMoreFromDoubleSubstation);
                    });
                  },
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  child: takingMoreFromDoubleSubstation
                      ? Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 187, 134),
                            borderRadius: BorderRadius.circular(9.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 187, 134)
                                    .withOpacity(0.65),
                                blurRadius: 10.0,
                                offset: const Offset(2.0, 0.0),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Single\nSubstation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Single\nSubstation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 214, 214, 214),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      takingMoreFromDoubleSubstation = false;
                      widget.onButtonPressed(takingMoreFromDoubleSubstation);
                    });
                  },
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  child: !takingMoreFromDoubleSubstation
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(9.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurpleAccent.shade100
                                    .withOpacity(0.5),
                                blurRadius: 10.0,
                                offset: const Offset(2.0, 0.0),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Double\nSubstation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Double\nSubstation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 214, 214, 214),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 15.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    width: 160.0,
                    fit: BoxFit.fitHeight,
                    'assets/imgs/substations.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

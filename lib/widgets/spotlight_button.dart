import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpotlightButton extends StatefulWidget {
  const SpotlightButton({
    required this.initialSpotlightButtonId,
    required this.onButtonPressed,
    super.key,
  });

  final String initialSpotlightButtonId;
  final void Function(String) onButtonPressed;

  @override
  State<SpotlightButton> createState() => _SpotlgithbuttonState();
}

class _SpotlgithbuttonState extends State<SpotlightButton> {
  late String spotlightButtonId = widget.initialSpotlightButtonId;
  // Three states:
  // notAttempted
  // scored
  // failed

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          if (spotlightButtonId == 'notAttempted') {
            spotlightButtonId = 'scored';
          } else if (spotlightButtonId == 'scored') {
            spotlightButtonId = 'failed';
          } else if (spotlightButtonId == 'failed') {
            spotlightButtonId = 'notAttempted';
          }

          widget.onButtonPressed(spotlightButtonId);
        });
      },
      borderRadius: BorderRadius.circular(16.0),
      padding: EdgeInsets.zero,
      child: Container(
        height: 50.0,
        width: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: spotlightButtonId == 'scored'
              ? const Color.fromARGB(255, 0, 154, 104)
              : spotlightButtonId == 'failed'
                  ? const Color.fromARGB(255, 208, 29, 107)
                  : const Color.fromARGB(255, 64, 64, 64),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spotlightButtonId == 'scored'
                ? const Icon(
                    Icons.check,
                    size: 15.0,
                    color: Colors.white,
                  )
                : spotlightButtonId == 'failed'
                    ? const Icon(
                        Icons.close,
                        size: 15.0,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.do_not_disturb_on_outlined,
                        size: 15.0,
                        color: Colors.white,
                      ),
            spotlightButtonId == 'scored'
                ? const Text(
                    'Scored',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  )
                : spotlightButtonId == 'failed'
                    ? const Text(
                        'Failed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      )
                    : const Text(
                        'None',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

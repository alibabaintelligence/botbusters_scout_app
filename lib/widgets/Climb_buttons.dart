import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClimbButtons extends StatefulWidget {
  const ClimbButtons({
    required this.climbId,
    required this.onButtonPressed,
    super.key,
  });

  final String climbId;
  final void Function(String) onButtonPressed;

  @override
  State<ClimbButtons> createState() => _ClimbState();
}

class _ClimbState extends State<ClimbButtons> {
  late String climbId = widget.climbId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 148 / 82,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              climbId = 'deepCage';
              widget.onButtonPressed(climbId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: climbId == 'deepCage'
                  ? const Color.fromARGB(255, 5, 0, 93)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Deep Cage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              climbId = 'shallowCage';
              widget.onButtonPressed(climbId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: climbId == 'shallowCage'
                  ? const Color.fromARGB(255, 42, 74, 202)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Shallow Cage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              climbId = 'failed';
              widget.onButtonPressed(climbId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: climbId == 'failed'
                  ? const Color.fromARGB(255, 135, 41, 55)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Failed Climb',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              climbId = 'parked';
              widget.onButtonPressed(climbId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: climbId == 'parked'
                  ? const Color.fromARGB(255, 28, 151, 32)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Parked',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              climbId = 'notAtt';
              widget.onButtonPressed(climbId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: climbId == 'notAtt'
                  ? const Color.fromARGB(255, 132, 132, 132)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Not Attempted',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AllianceButtons extends StatefulWidget {
  const AllianceButtons({
    required this.allianceId,
    required this.onButtonPressed,
    super.key,
  });

  final String allianceId;
  final void Function(String) onButtonPressed;

  @override
  State<AllianceButtons> createState() => _AllianceButtonsState();
}

class _AllianceButtonsState extends State<AllianceButtons> {
  late String allianceId = widget.allianceId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 8 / 6.5,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'blue1';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'blue1'
                  ? const Color.fromARGB(255, 174, 209, 255)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '1',
                  style: TextStyle(
                    color: Color.fromARGB(255, 43, 0, 255),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Blue 1',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'blue2';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'blue2'
                  ? const Color.fromARGB(255, 174, 209, 255)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '2',
                  style: TextStyle(
                    color: Color.fromARGB(255, 43, 0, 255),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Blue 2',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'blue3';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'blue3'
                  ? const Color.fromARGB(255, 174, 209, 255)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '3',
                  style: TextStyle(
                    color: Color.fromARGB(255, 43, 0, 255),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Blue 3',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'red1';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'red1'
                  ? const Color.fromARGB(255, 255, 185, 185)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '1',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Red 1',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'red2';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'red2'
                  ? const Color.fromARGB(255, 255, 185, 185)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '2',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Red 2',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              allianceId = 'red3';
              widget.onButtonPressed(allianceId);
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
              color: allianceId == 'red3'
                  ? const Color.fromARGB(255, 255, 185, 185)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '3',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Red 3',
                  style: TextStyle(
                    color: Colors.black,
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

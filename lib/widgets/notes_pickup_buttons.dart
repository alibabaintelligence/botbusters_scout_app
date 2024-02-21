import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesPickupButtons extends StatefulWidget {
  const NotesPickupButtons({
    required this.notesPickupId,
    required this.onButtonPressed,
    super.key,
  });

  final void Function(String) onButtonPressed;
  final String notesPickupId;

  @override
  State<NotesPickupButtons> createState() => _FloorPickupState();
}

class _FloorPickupState extends State<NotesPickupButtons> {
  late String notesPickupId = widget.notesPickupId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 7.5 / 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              notesPickupId = 'source';
              widget.onButtonPressed(notesPickupId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: notesPickupId == 'source'
                  ? const Color.fromARGB(255, 146, 115, 68)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/notesPickup/source.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Source',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              notesPickupId = 'floor';
              widget.onButtonPressed(notesPickupId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: notesPickupId == 'floor'
                  ? const Color.fromARGB(255, 114, 114, 114)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/notesPickup/floor.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Floor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            setState(() {
              notesPickupId = 'both';
              widget.onButtonPressed(notesPickupId);
            });
          },
          borderRadius: BorderRadius.circular(16.0),
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: notesPickupId == 'both'
                  ? const Color.fromARGB(255, 202, 122, 48)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/notesPickup/both.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Both',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
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

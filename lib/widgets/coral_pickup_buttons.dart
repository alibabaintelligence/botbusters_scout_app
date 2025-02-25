import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoralPickupButtons extends StatefulWidget {
  const CoralPickupButtons({
    required this.coralPickupId,
    required this.onButtonPressed,
    super.key,
  });

  final void Function(String) onButtonPressed;
  final String coralPickupId;

  @override
  State<CoralPickupButtons> createState() => _CoralPickupState();
}

class _CoralPickupState extends State<CoralPickupButtons> {
  late String coralPickupId = widget.coralPickupId;

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
              coralPickupId = 'source';
              widget.onButtonPressed(coralPickupId);
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
              color: coralPickupId == 'source'
                  ? const Color.fromARGB(255, 146, 115, 68)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/notesPickup/source.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Station',
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
              coralPickupId = 'floor';
              widget.onButtonPressed(coralPickupId);
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
              color: coralPickupId == 'floor'
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
              coralPickupId = 'both';
              widget.onButtonPressed(coralPickupId);
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
              color: coralPickupId == 'both'
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

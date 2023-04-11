import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloorPickupButtons extends StatefulWidget {
  const FloorPickupButtons({
    required this.floorPickupId,
    required this.onButtonPressed,
    super.key,
  });

  final void Function(String) onButtonPressed;
  final String floorPickupId;

  @override
  State<FloorPickupButtons> createState() => _FloorPickupState();
}

class _FloorPickupState extends State<FloorPickupButtons> {
  late String floorPickupId = widget.floorPickupId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 6.5 / 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              floorPickupId = 'cones';
              widget.onButtonPressed(floorPickupId);
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
              color: floorPickupId == 'cones'
                  ? const Color.fromARGB(255, 97, 98, 41)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/floorPickup/cones.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Cones',
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
              floorPickupId = 'cubes';
              widget.onButtonPressed(floorPickupId);
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
              color: floorPickupId == 'cubes'
                  ? const Color.fromARGB(255, 81, 43, 118)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/floorPickup/cubes.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Cubes',
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
              floorPickupId = 'both';
              widget.onButtonPressed(floorPickupId);
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
              color: floorPickupId == 'both'
                  ? Color.fromARGB(255, 148, 28, 48)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/floorPickup/both.svg'),
                const SizedBox(height: 6),
                const Text(
                  'Both',
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
              floorPickupId = 'none';
              widget.onButtonPressed(floorPickupId);
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
              color: floorPickupId == 'none'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/x.svg'),
                const SizedBox(height: 6),
                const Text(
                  'None',
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

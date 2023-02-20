import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                  ? const Color.fromARGB(255, 255, 242, 175)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'V',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 214, 0),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Cones',
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
                  ? const Color.fromARGB(255, 237, 199, 255)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'O',
                  style: TextStyle(
                    color: Color.fromARGB(255, 173, 0, 255),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Cubes',
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
                  ? const Color.fromARGB(255, 169, 255, 187)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'VO',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 213, 47),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Both',
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
                  ? const Color.fromARGB(255, 208, 208, 208)
                  : const Color.fromARGB(255, 239, 239, 239),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'X',
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'None',
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

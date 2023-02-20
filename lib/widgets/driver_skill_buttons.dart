import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverSkillButtons extends StatefulWidget {
  const DriverSkillButtons({
    required this.driverSkillId,
    required this.onButtonPressed,
    super.key,
  });

  final String driverSkillId;
  final void Function(String) onButtonPressed;

  @override
  State<DriverSkillButtons> createState() => _DriverSkillState();
}

class _DriverSkillState extends State<DriverSkillButtons> {
  late String driverSkillId = widget.driverSkillId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 148 / 82,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              driverSkillId = 'veryEff';
              widget.onButtonPressed(driverSkillId);
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
              color: driverSkillId == 'veryEff'
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
                  'Very Effective',
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
              driverSkillId = 'eff';
              widget.onButtonPressed(driverSkillId);
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
              color: driverSkillId == 'eff'
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
                  'Effective',
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
              driverSkillId = 'notEff';
              widget.onButtonPressed(driverSkillId);
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
              color: driverSkillId == 'notEff'
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
                  'Not Effective',
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
              driverSkillId = 'notObs';
              widget.onButtonPressed(driverSkillId);
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
              color: driverSkillId == 'notObs'
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
                  'Not Observed',
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

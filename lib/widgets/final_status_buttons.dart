import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class FinalStatusButtons extends StatefulWidget {
  const FinalStatusButtons({
    required this.finalStatusId,
    required this.onButtonPressed,
    super.key,
  });

  final void Function(String) onButtonPressed;
  final String finalStatusId;

  @override
  State<FinalStatusButtons> createState() => _FinalStatusState();
}

class _FinalStatusState extends State<FinalStatusButtons> {
  late String finalStatusId = widget.finalStatusId;

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
              finalStatusId = 'parked';
              widget.onButtonPressed(finalStatusId);
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
              color: finalStatusId == 'parked'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/finalStatus/parked.svg'),
                const SizedBox(height: 8),
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
              finalStatusId = 'docked';
              widget.onButtonPressed(finalStatusId);
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
              color: finalStatusId == 'docked'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/finalStatus/docked.svg'),
                const SizedBox(height: 8),
                const Text(
                  'Docked',
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
              finalStatusId = 'engaged';
              widget.onButtonPressed(finalStatusId);
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
              color: finalStatusId == 'engaged'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/finalStatus/engaged.svg'),
                const SizedBox(height: 8),
                const Text(
                  'Engaged',
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
              finalStatusId = 'failed';
              widget.onButtonPressed(finalStatusId);
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
              color: finalStatusId == 'failed'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/finalStatus/failed.svg'),
                const SizedBox(height: 8),
                const Text(
                  'Failed',
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
              finalStatusId = 'notAttempted';
              widget.onButtonPressed(finalStatusId);
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
              color: finalStatusId == 'notAttempted'
                  ? const Color.fromARGB(255, 90, 90, 90)
                  : const Color.fromARGB(255, 64, 64, 64),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6),
                SvgPicture.asset('assets/svgs/x.svg'),
                const SizedBox(height: 6),
                const FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Not Attempted',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                      ),
                    ),
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

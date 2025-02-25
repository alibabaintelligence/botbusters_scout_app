import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BargeWidget extends StatefulWidget {
  const BargeWidget({
    required this.bargeId,
    required this.onButtonPressed,
    super.key,
  });

  final String bargeId;
  final void Function(String) onButtonPressed;

  @override
  State<BargeWidget> createState() => _BargeWidgetState();
}

class _BargeWidgetState extends State<BargeWidget> {
  late String bargeId = widget.bargeId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 100 / 82,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildBargeButton(
          id: 'deep',
          label: 'Deep',
          color: const Color.fromARGB(255, 43, 121, 73),
          icon: 'assets/svgs/barge/deep.svg',
        ),
        _buildBargeButton(
          id: 'shallow',
          label: 'Shallow',
          color: const Color.fromARGB(255, 43, 59, 121),
          icon: 'assets/svgs/barge/shallow.svg',
        ),
        _buildBargeButton(
          id: 'parked',
          label: 'Parked',
          color: const Color.fromARGB(255, 121, 95, 43),
          icon: 'assets/svgs/barge/parked.svg',
        ),
        _buildBargeButton(
          id: 'failed',
          label: 'Failed',
          color: const Color.fromARGB(255, 135, 41, 55),
          icon: 'assets/svgs/barge/failed.svg',
        ),
        _buildBargeButton(
          id: 'notAttempted',
          label: 'Not\nAttempted',
          color: const Color.fromARGB(255, 90, 90, 90),
          icon: 'assets/svgs/x.svg',
        ),
      ],
    );
  }

  Widget _buildBargeButton({
    required String id,
    required String label,
    required Color color,
    required String icon,
  }) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          bargeId = id;
          widget.onButtonPressed(bargeId);
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
          color: bargeId == id
              ? color
              : const Color.fromARGB(255, 64, 64, 64),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 24, // Made icons slightly smaller
            ),
            const SizedBox(height: 4), // Reduced spacing
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13, // Slightly smaller text
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

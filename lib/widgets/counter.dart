import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoolCounter extends StatefulWidget {
  const CoolCounter({
    super.key,
    required this.max,
    required this.min,
    required this.value,
    this.step = 1,
    required this.whenChanged,
  });

  /// Max value (4 digits max)
  final int max;

  /// Min value (4 digits max)
  final int min;

  /// DO NOT USE A CONSTANT, IT'S THE VARIABLE BEEN CHANGED
  final int value;

  /// It's 1 by default
  final int step;

  final void Function(int newValue) whenChanged;

  @override
  State<CoolCounter> createState() => _CoolCounterState();
}

class _CoolCounterState extends State<CoolCounter> {
  final _counterController = TextEditingController();

  @override
  void initState() {
    _counterController.text = widget.value.toString();

    super.initState();
  }

  late int value = widget.value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: () {
            if (value > widget.min) {
              setState(() {
                value--;
                _counterController.text = value.toString();
              });
              widget.whenChanged(value);
            }
          },
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade400.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              CupertinoIcons.minus,
              color: Colors.blue.shade100,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(64, 64, 64, 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: IntrinsicWidth(
            child: TextFormField(
              controller: _counterController,
              decoration: const InputDecoration.collapsed(
                hintText: '0',
              ),
              keyboardType: TextInputType.number,
              buildCounter: (
                context, {
                required int currentLength,
                required bool isFocused,
                required int? maxLength,
              }) =>
                  null,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              maxLength: 4,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                int? intValue = int.tryParse(_counterController.text);

                if (intValue == null) {
                  intValue = 0;
                  _counterController.text = intValue.toString();
                } else if (intValue > widget.max) {
                  intValue = widget.max;
                  _counterController.text = intValue.toString();
                } else if (intValue < widget.min) {
                  intValue = widget.min;
                  _counterController.text = intValue.toString();
                }

                value = intValue;

                widget.whenChanged(value);
              },
              onTapOutside: (_) {
                int? intValue = int.tryParse(_counterController.text);

                if (intValue == null) {
                  intValue = 0;
                  _counterController.text = intValue.toString();
                } else if (intValue > widget.max) {
                  intValue = widget.max;
                  _counterController.text = intValue.toString();
                } else if (intValue < widget.min) {
                  intValue = widget.min;
                  _counterController.text = intValue.toString();
                }

                value = intValue;
              },
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            if (value < widget.max) {
              setState(() {
                value++;
                _counterController.text = value.toString();
                widget.whenChanged(value);
              });
            }
          },
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade400.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              CupertinoIcons.add,
              color: Colors.greenAccent.shade100,
            ),
          ),
        ),
      ],
    );
  }
}

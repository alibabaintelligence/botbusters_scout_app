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
          child: Container(
            height: 18,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(CupertinoIcons.minus),
          ),
        ),
        Container(
          height: 18,
          width: 20,
          color: Colors.grey,
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
                color: Colors.black87,
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
          child: Container(
            height: 18,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(CupertinoIcons.add),
          ),
        ),
      ],
    );
  }
}

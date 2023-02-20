import 'package:flutter/material.dart';

class WriteNumberWidget extends StatelessWidget {
  const WriteNumberWidget({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  final int maxNumber = 9999;
  final int minNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color.fromARGB(255, 239, 239, 239),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: IntrinsicWidth(
            child: TextFormField(
              controller: controller,
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
              maxLength: 5,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              validator: (title) {
                if (title == null || title.isEmpty) {
                  return "Write something";
                }
                return null;
              },
              onChanged: (value) {
                int? intValue = int.tryParse(value);

                if (intValue == null) {
                  intValue = 0;
                  value = intValue.toString();
                } else if (intValue > maxNumber) {
                  intValue = maxNumber;
                  value = intValue.toString();
                } else if (intValue < minNumber) {
                  intValue = minNumber;
                  value = intValue.toString();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

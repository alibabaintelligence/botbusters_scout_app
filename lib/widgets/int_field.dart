import 'package:flutter/material.dart';

class IntField extends StatelessWidget {
  const IntField({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  final int max = 9999;
  final int min = 0;

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
            color: const Color.fromRGBO(64, 64, 64, 1.0),
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
                color: Colors.white70,
                fontSize: 16,
              ),
              maxLength: 5,
              maxLines: 1,
              validator: (title) {
                if (title == null || title.isEmpty) {
                  return "Write something";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                int? intValue = int.tryParse(controller.text);

                if (intValue == null) {
                  intValue = 0;
                  controller.text = intValue.toString();
                } else if (intValue > max) {
                  intValue = max;
                  controller.text = intValue.toString();
                } else if (intValue < min) {
                  intValue = min;
                  controller.text = intValue.toString();
                }

                FocusScope.of(context).unfocus();
              },
              onTapOutside: (_) {
                int? intValue = int.tryParse(controller.text);

                if (intValue == null) {
                  intValue = 0;
                  controller.text = intValue.toString();
                } else if (intValue > max) {
                  intValue = max;
                  controller.text = intValue.toString();
                } else if (intValue < min) {
                  intValue = min;
                  controller.text = intValue.toString();
                }

                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ],
    );
  }
}

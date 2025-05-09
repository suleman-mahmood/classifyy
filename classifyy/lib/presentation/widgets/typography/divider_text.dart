import 'package:classifyy/presentation/config/utils.dart';
import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;

  const DividerText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: RaabtaColors.grey(),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: RaabtaColors.black(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: RaabtaColors.grey(),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../data/resources/color_resource.dart';
import '../../../data/resources/constant_resource.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? labelColor;
  final bool isSmall;
  final double? elevation;
  final bool needBorder;
  final Color? borderColor;
  const CommonButton({
    Key? key,
    this.buttonColor = APP_MAIN_BLUE,
    this.elevation,
    this.labelColor = WHITE,
    required this.label,
    required this.onTap,
    this.isSmall = false,
    this.needBorder = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // <-- Radius
                side: needBorder
                    ? BorderSide(color: borderColor!, width: 1)
                    : BorderSide.none),
          ),
          child: Center(
            child: Text(
              label,
              style: caption(context)?.copyWith(color: labelColor),
              textAlign: CENTER_ALIGN,
            ),
          )),
    );
  }
}

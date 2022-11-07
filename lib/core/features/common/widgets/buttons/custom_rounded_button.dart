// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../../../../utils/constants.dart';

class CustomRoundedButton extends StatefulWidget {
  final String? label;
  final Color? color;
  final void Function()? onPressed;
  final bool? enabled;

  CustomRoundedButton({
    this.label,
    this.color,
    this.onPressed,
    this.enabled,
  });

  @override
  State<CustomRoundedButton> createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed!,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) => const Size(120, 15),
        ),
        backgroundColor:
            MaterialStateProperty.all(widget.color ?? COR_PRIMARIA),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
      ),
      child: Text(
        widget.label!,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

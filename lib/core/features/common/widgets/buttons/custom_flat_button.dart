// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../../../utils/constants.dart';

class CustomFlatButton extends StatefulWidget {
  final String? label;
  final Color? color;
  final void Function()? onPressed;
  final bool? enabled;

  CustomFlatButton({
    this.label,
    this.color,
    this.onPressed,
    this.enabled,
  });

  @override
  State<CustomFlatButton> createState() => _CustomFlatButtonState();
}

class _CustomFlatButtonState extends State<CustomFlatButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed!,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) => const Size(120, 30),
        ),
        backgroundColor:
            MaterialStateProperty.all(widget.color ?? COR_PRIMARIA),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
      ),
      child: Text(
        widget.label!,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

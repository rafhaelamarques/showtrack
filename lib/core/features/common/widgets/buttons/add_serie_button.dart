// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class AddSerieButton extends StatefulWidget {
  const AddSerieButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final void Function() onPressed;

  @override
  State<AddSerieButton> createState() => _AddSerieButtonState();
}

class _AddSerieButtonState extends State<AddSerieButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) => const Size(200, 30),
        ),
        backgroundColor: MaterialStateProperty.all(COR_TERCIARIA),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: WHITE,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Icon(
            widget.icon,
            color: WHITE,
            size: 28,
          ),
        ],
      ),
    );
  }
}

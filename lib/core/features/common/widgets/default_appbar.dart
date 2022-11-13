// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    required this.titleText,
    this.center,
    this.actionsWidget,
    this.leadingWidget,
  });

  final String titleText;
  final bool? center;
  final List<Widget>? actionsWidget;
  final Widget? leadingWidget;

  @override
  Widget? get title => Text(titleText,
      style: const TextStyle(color: COR_PRIMARIA, fontSize: 18));

  @override
  Widget? get leading => leadingWidget ?? const SizedBox();

  @override
  List<Widget> get actions => actionsWidget ?? [];

  @override
  Color? get backgroundColor => Colors.white;

  @override
  double get elevation => 0;

  @override
  bool get centerTitle => center ?? true;

  @override
  IconThemeData get iconTheme =>
      const IconThemeData(color: COR_PRIMARIA, size: 25);
}

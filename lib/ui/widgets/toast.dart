import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:showtrack/core/styles/colors.dart';

class BaseToast {
  static void showToast({
    required BuildContext context,
    required String message,
  }) {
    var fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: gray,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info_outline, color: white),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showtrack/utils/constants.dart';

class SplashCreenShowTrack extends StatefulWidget {
  const SplashCreenShowTrack({Key? key}) : super(key: key);

  @override
  State<SplashCreenShowTrack> createState() => _SplashCreenShowTrackState();
}

class _SplashCreenShowTrackState extends State<SplashCreenShowTrack> {
  Timer? _timer;
  int _second = 3;

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              COR_PRIMARIA,
              COR_TERCIARIA,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/logo_splash.png"),
          ),
        ),
      ),
    ));
  }
}

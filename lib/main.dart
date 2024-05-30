import 'package:flutter/material.dart';
import 'package:showtrack/core/services/application.dart';
import 'package:showtrack/core/styles/colors.dart';
import 'package:showtrack/ui/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Application.initialize();

  runApp(const ShowTrackApp());
}

class ShowTrackApp extends StatelessWidget {
  const ShowTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: midRed),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

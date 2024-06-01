import 'package:flutter/material.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/ui/pages/splash/splash_page.dart';
import 'package:showtrack/ui/styles/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Application.setup();

  runApp(const ShowTrackApp());
}

class ShowTrackApp extends StatelessWidget {
  const ShowTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.midRed),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

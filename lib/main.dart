import 'package:flutter/material.dart';
import 'package:showtrack/utils/constants.dart';
import 'package:showtrack/services/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Routes _routes = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      navigatorKey: _routes.navigatorKey,
      onGenerateRoute: _routes.generateRoute,
    );
  }
}

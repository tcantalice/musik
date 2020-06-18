import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusiK',
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      navigatorKey: Modular.navigatorKey,
    );
  }
}

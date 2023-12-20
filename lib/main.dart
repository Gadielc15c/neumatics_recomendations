import 'package:flutter/material.dart';
import 'package:neumatics_recomendations/User.dart';
import 'package:neumatics_recomendations/user_responses.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserResponses(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommendations App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserRegistrationScreen(),
    );
  }
}

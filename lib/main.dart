import 'package:auth/domain/presentation/pages/splash_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              background: backgroundColor,
              secondary: secondaryColor,
            ),
        textTheme: TextTheme(
          bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: titleColor,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: titleColor,
              ),
        ),
      ),
      home: const SplashScreenPage(),
    );
  }
}

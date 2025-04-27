import 'package:flutter/material.dart';
import 'package:ucp1/auth/login_page.dart';
import 'package:ucp1/auth/register_page.dart';
import 'package:ucp1/home/home_page.dart';
import 'package:ucp1/piket/piket_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      locale: Locale('id', 'ID'),
      supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const PiketPage(user: "tesedw",),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ucp1/auth/login_page.dart';
import 'package:ucp1/auth/register_page.dart';
import 'package:ucp1/home/home_page.dart';
import 'package:ucp1/pelanggan/pelanggan_page.dart';
import 'package:ucp1/piket/detail_piket_page.dart';
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
      // home: const PelangganPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) {
          final String user =
              ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(user: user);
        },
        '/piket': (context) {
          final String user =
              ModalRoute.of(context)!.settings.arguments as String;
          return PiketPage(user: user);
        },
        '/detailPiket': (context) {
          final Map<String, String> args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return DetailPiketPage(
            user: args['user']!,
            tanggal: args['tanggal']!,
            tugas: args['tugas']!,
          );
        },
      },
    );
  }
}

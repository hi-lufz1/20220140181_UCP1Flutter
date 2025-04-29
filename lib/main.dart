import 'package:flutter/material.dart';
import 'package:ucp1/auth/login_page.dart';
import 'package:ucp1/auth/register_page.dart';
import 'package:ucp1/barang/barang_page.dart';
import 'package:ucp1/barang/detail_barang_page.dart';
import 'package:ucp1/home/home_page.dart';
import 'package:ucp1/pelanggan/detail_pelanggan_page.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) {
          final String user =
              ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(user: user);
        },
        //Piket
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
        //Pelanggan
        '/pelanggan': (context) => const PelangganPage(),
        '/detailPelanggan': (context) {
          final Map<String, String> args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return DetailPelangganPage(
            nama: args['nama']!,
            email: args['email']!,
            noHp: args['noHp']!,
            alamat: args['alamat']!,
            provinsi: args['provinsi']!,
            kodePos: args['kodePos']!,
          );
        },
        //Barang
        '/barang': (context) => const BarangPage(),
        '/detailBarang': (context) {
          final Map<String, dynamic> args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return DetailBarangPage(
            tanggal: args['tanggal'],
            jenisTransaksi: args['jenisTransaksi'],
            jenisBarang: args['jenisBarang'],
            jumlahBarang: int.tryParse(args['jumlahBarang']) ?? 0,
            hargaSatuan: int.tryParse(args['hargaSatuan']) ?? 0,
          );
        },
      },
    );
  }
}

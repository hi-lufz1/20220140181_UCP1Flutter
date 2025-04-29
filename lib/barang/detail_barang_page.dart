import 'package:flutter/material.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  const DetailBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
  });

  int get totalHarga => jumlahBarang * hargaSatuan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green.shade100,
              child: const Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

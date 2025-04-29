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
              radius: 70,
              backgroundColor:   Color.fromRGBO(200, 249, 255, 1),
              child: const Icon(
                Icons.check_circle,
                size: 100,
                color: Color.fromRGBO(0, 198, 224, 1),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _detail('Tanggal', tanggal),
                  _detail('Jenis Transaksi', jenisTransaksi),
                  _detail('Jenis Barang', jenisBarang),
                  _detail('Jumlah Barang', jumlahBarang.toString()),
                  _detail('Jenis Harga Satuan', 'Rp. $hargaSatuan'),
                  _detail('Total Harga', 'Rp. $totalHarga'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Color.fromRGBO(0, 224, 255, 1),
                        ),
                        fixedSize: WidgetStateProperty.all(Size.fromHeight(50)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        int count = 0;
                        Navigator.popUntil(context, (route) {
                          return count++ == 2;
                        });
                      },
                      child: Text("Selesai"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 16)),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          const Divider(thickness: 1, height: 1, color: Colors.black12),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String user = 'User';
  final String tanggal = '2023-10-01';  
  final String tugas = 'Tugas Piket';

  const DetailPiketPage({
    super.key,
    // required this.user,
    // required this.tanggal,
    // required this.tugas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(0, 224, 255, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail $tugas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      
    );
  }
}

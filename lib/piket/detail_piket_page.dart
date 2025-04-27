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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanggal,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(5, 169, 198, 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 224, 255, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    user,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(27, 27, 27, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                tugas,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

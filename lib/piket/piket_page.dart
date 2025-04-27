import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  const PiketPage({super.key});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  List<Map<String, String>> piketList = [];

  void addPiket() {
    if (emailController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        taskController.text.isNotEmpty) {
      setState(() {
        piketList.add({
          'nama': emailController.text,
          'tanggal': dateController.text,
          'tugas': taskController.text,
        });

        emailController.clear();
        dateController.clear();
        taskController.clear();
      });
    }
  }

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
        title: const Text(
          'Piket Gudang',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Anggota", style: TextStyle(fontSize: 16)),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Tanggal Piket", style: TextStyle(fontSize: 16)),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Tugas Piket", style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.black,
                      ),
                      fixedSize: WidgetStateProperty.all(Size.fromHeight(50)),
                    ),
                    onPressed: () {
                      addPiket();
                    },
                    child: Text(
                      "Tambah",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daftar Tugas Piket",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child:
                  piketList.isEmpty
                      ? Center(
                        child: Text(
                          "Belum ada Data",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                      : ListView.builder(
                        shrinkWrap: true,
                        itemCount: piketList.length,
                        itemBuilder: (context, index) {
                          final piket = piketList[index];
                          return Card(
                            color: Color.fromRGBO(5, 169, 198, 1),
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(
                                piket['tugas'] ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

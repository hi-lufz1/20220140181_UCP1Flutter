import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/piket/detail_piket_page.dart';

class PiketPage extends StatefulWidget {
  final String user;

  const PiketPage({super.key, required this.user});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  List<Map<String, String>> piketList = [];

  void addPiket() {
    if (dateController.text.isNotEmpty && taskController.text.isNotEmpty) {
      setState(() {
        piketList.add({
          'nama': widget.user,
          'tanggal': dateController.text,
          'tugas': taskController.text,
        });

        dateController.clear();
        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Anggota", style: TextStyle(fontSize: 16)),
              TextFormField(
                readOnly: true,
                initialValue: widget.user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text("Pilih Tanggal", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Pilih Tanggal',
                  prefixIcon: Icon(Icons.today_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Color.fromRGBO(5, 169, 198, 1),
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                          dialogTheme: DialogThemeData(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      setState(() {
                        dateController.text = DateFormat(
                          'EEEE, dd MMMM yyyy',
                          'id_ID',
                        ).format(pickedDate);
                      });
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text("Tugas Piket", style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
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
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addPiket();
                        }
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
                                trailing: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/detailPiket',
                                      arguments: {
                                        'user': piket['nama']!,
                                        'tanggal': piket['tanggal']!,
                                        'tugas': piket['tugas']!,
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
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
      ),
    );
  }
}

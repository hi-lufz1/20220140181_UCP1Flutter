import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();

  String? selectedTransaksi;
  String? selectedBarang;

  final List<String> transaksiList = ['Barang Masuk', 'Barang Keluar'];

  final Map<String, int> barangHarga = {
    'Laptop': 8000000,
    'HP': 3000000,
    'Printer': 1500000,
    'Monitor': 2000000,
    'Keyboard': 500000,
  };

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
          'Pendataan Barang',
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
              Text("Jenis Transaksi", style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                value: selectedTransaksi,
                hint: Text("Pilih Jenis Transaksi"),
                items:
                    transaksiList.map((transaksi) {
                      return DropdownMenuItem(
                        value: transaksi,
                        child: Text(transaksi),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTransaksi = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Pilih jenis transaksi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text("Jenis Barang", style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                value: selectedBarang,
                hint: Text("Pilih Jenis Barang"),
                items:
                    barangHarga.keys.map((barang) {
                      return DropdownMenuItem(
                        value: barang,
                        child: Text(barang),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBarang = value;
                    hargaController.text =
                        barangHarga[value!]?.toString() ?? '';
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Pilih jenis barang';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jumlah Barang", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: jumlahController,
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harga Satuan", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: hargaController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Harga Satuan',
                            prefixText: "Rp",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
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
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

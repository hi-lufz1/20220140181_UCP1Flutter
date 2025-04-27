import 'package:flutter/material.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final TextEditingController nameCustController = TextEditingController();
  final TextEditingController emailCustController = TextEditingController();
  final TextEditingController hpCustController = TextEditingController();
  final TextEditingController addresController = TextEditingController();
  final TextEditingController provController = TextEditingController();
  final TextEditingController posController = TextEditingController();

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
          'Data Pelanggan',
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
              Text("Nama Cust", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: nameCustController,
                decoration: InputDecoration(
                  hintText: 'Nama Cust',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: emailCustController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No Hp", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: hpCustController,
                          decoration: InputDecoration(
                            hintText: 'No Hp',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text("Alamat", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: addresController,
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Provinsi", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: provController,
                          decoration: InputDecoration(
                            hintText: 'Provinsi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kode Pos", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: posController,
                          decoration: InputDecoration(
                            hintText: 'Kode Pos',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
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

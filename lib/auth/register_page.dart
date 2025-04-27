import 'package:flutter/material.dart';
import 'package:ucp1/auth/login_page.dart';
import 'package:ucp1/home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController confirmPWController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPW = true;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/cosmologo _transparan.png",
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      "DAFTAR AKUN BARU",
                      style: TextStyle(fontSize: 28),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Lengkap", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            hintText: 'Nama Lengkap',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama lengkap tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email", style: TextStyle(fontSize: 16)),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("No Hp", style: TextStyle(fontSize: 16)),
                              TextFormField(
                                controller: hpController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  hintText: 'No Hp',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'No Hp tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password', style: TextStyle(fontSize: 16)),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  hintText: 'Password',
                                ),
                                obscureText: _obscurePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Konfirmasi Password',
                                style: TextStyle(fontSize: 16),
                              ),
                              TextFormField(
                                controller: confirmPWController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPW = !_obscureConfirmPW;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  hintText: 'Konfirmasi Password',
                                ),
                                obscureText: _obscureConfirmPW,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Konfirmasi password tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                        Color.fromRGBO(0, 224, 255, 1),
                                      ),
                                  fixedSize: WidgetStateProperty.all(
                                    Size.fromHeight(50),
                                  ),
                                  shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (passwordController.text !=
                                        confirmPWController.text) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('Password tidak sama'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => HomePage(
                                              user: emailController.text,
                                            ),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Daftar'),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Sudah memiliki akun? Silahkan ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Login disini!',
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 172, 203, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

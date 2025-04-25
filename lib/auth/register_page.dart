import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "DAFTAR AKUN BARU",
                      style: TextStyle(fontSize: 32),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: hpController,
                      decoration: const InputDecoration(labelText: 'No Hp'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your no hp';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Konfirmasi Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Daftar')),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/login');
                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const LoginPage()),
                        // );
                      },
                      child: Text(
                        'Sudah memiliki akun? Silahkan login disini!',
                      ),
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

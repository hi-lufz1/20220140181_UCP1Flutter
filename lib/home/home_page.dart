import 'package:flutter/material.dart';
import 'package:ucp1/widget/menu_button.dart';

class HomePage extends StatelessWidget {
  final String user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profil.jpeg"),
              radius: 26,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  user,
                  style: TextStyle(
                    color:  Color.fromRGBO(0, 224, 255, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.logout,color: Colors.white ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/images/banner.jpg"),
              ),
              SizedBox(height: 48),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MenuButton(
                            title: "Data Piket",
                            icon: Icons.edit_calendar,
                            onTap: () {
                              Navigator.pushNamed(context, '/piket', arguments: user);
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: MenuButton(
                            title: "Data Pelanggan",
                            icon: Icons.dashboard_customize_rounded,
                            onTap: () {
                              Navigator.pushNamed(context, '/pelanggan');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: MenuButton(
                            title: "Barang Masuk/Keluar",
                            icon: Icons.receipt_long,
                            onTap: () {
                              Navigator.pushNamed(context, '/barang');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text(
          'Selamat datang di lava music, pusat jual beli alat musik berkualitas! Temukan beragam pilihan bass, drum, gitar, dan efek suara terbaik untuk kebutuhan musik Anda. Dapatkan penawaran spesial dan layanan pelanggan yang memuaskan hanya di sini. Mari ciptakan musik bersama!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

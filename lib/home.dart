import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';
import 'guitar.dart';
import 'drum.dart';
import 'bass.dart';
import 'efek.dart';
import 'keranjang.dart';

class HomePage extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuButton(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            MenuButton(
              icon: Icons.music_note,
              text: 'Guitar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuitarPage()),
                );
              },
            ),
            MenuButton(
              icon: Icons.music_video,
              text: 'Efek',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EfekPage()),
                );
              },
            ),
            MenuButton(
              icon: Icons.settings,
              text: 'Drum',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrumPage()),
                );
              },
            ),
            MenuButton(
              icon: Icons.info,
              text: 'Bass',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BassPage()),
                );
              },
            ),
            MenuButton(
              icon: Icons.shopping_cart,
              text: 'Keranjang',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeranjangPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  MenuButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blue,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

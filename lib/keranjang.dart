import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<dynamic> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    try {
      // Ganti URL dengan URL API Anda yang mengambil data dari tabel keranjang
      final response = await http.get(Uri.parse('http://mobilecomputing.my.id/api_banu/get_cart.php'));
      if (response.statusCode == 200) {
        setState(() {
          _cartItems = json.decode(response.body);
        });
      } else {
        // Handle error
        print('Failed to load cart items: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      print('Exception while loading cart items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: _cartItems.isEmpty
          ? Center(child: Text('Keranjang kosong'))
          : ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(_cartItems[index]['gambar']),
            title: Text(_cartItems[index]['nama']),
            subtitle: Text('Kuantiti: ${_cartItems[index]['kuantiti']}'),
            trailing: Text('Rp ${_cartItems[index]['harga']}'),
          );
        },
      ),
    );
  }
}

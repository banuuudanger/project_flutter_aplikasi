import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductList extends StatelessWidget {
  final String category;

  ProductList({required this.category});

  Future<List<dynamic>> fetchProducts() async {
    try {
      var url = Uri.parse('http://mobilecomputing.my.id/api_banu/get_products.php?kategori=$category');
      var result = await http.get(url);
      if (result.statusCode == 200) {
        return json.decode(result.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: fetchProducts(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No products found');
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(snapshot.data?[index]['gambar']),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data?[index]['nama'],
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data?[index]['deskripsi']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$${snapshot.data?[index]['harga']}",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              var userId = 1; // Example user ID, you can replace it with actual user ID
                              var productId = snapshot.data?[index]['id'];
                              var url = Uri.parse('http://mobilecomputing.my.id/api_banu/add_to_cart.php');
                              var response = await http.post(url, body: {
                                'user_id': '$userId',
                                'produk_id': '$productId',
                                'jumlah': '1',
                              });
                              if (response.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to cart!'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to add to cart'),
                                  ),
                                );
                              }
                            },
                            child: Text('Add to Cart'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

# Praktikum 5: Membangun Navigasi di Flutter
### **Langkah 1: Siapkan project baru**
![alt text](../images/image-4.png)
### **Langkah 2: Mendefinisikan Route**
```dart
homepage.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
```
```dart
item_page.dart

import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  } 
}
```
### **Langkah 3: Lengkapi Kode di ```main.dart```**
```dart
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
    },
  ));
}
```
### **Langkah 4: Membuat data model**
```dart
item.dart

class Item {
  String? name;
  int? price;

  Item({this.name, this.price});  
}
```
### **Langkah 5: Lengkapi kode di ```Homepage```**
```dart
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
```
### **Langkah 6: Membuat ListView dan itemBuilder**
```dart
home_page.dart

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: Text(item.name)),
                    Expanded(
                      child: Text(
                        item.price.toString(),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
```
> Hasil Output:\
![alt text](../images/image-5.png)
### **Langkah 7: Menambahkan aksi pada ListView**
```dart
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/item');
              },
```
> Pada saat aplikasi dijalankan dan ListView disentuh menghasilkan kesalahan:\
![alt text](../images//image-6.png)

# Tugas Praktikum 2
1. Untuk melakukan pengiriman data ke halaman berikutnya, cukup menambahkan informasi arguments pada penggunaan ```Navigator```. Perbarui kode pada bagian ```Navigator``` menjadi seperti berikut:
```dart
home_page.dart

            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/item', arguments: item);
              },
```
2. Pembacaan nilai yang dikirimkan pada halaman sebelumnya dapat dilakukan menggunakan ModalRoute. Tambahkan kode berikut pada blok fungsi build dalam halaman ItemPage. Setelah nilai didapatkan, anda dapat menggunakannya seperti penggunaan variabel pada umumnya.
```dart
item_page.dart

import 'package:flutter/material.dart';
import '/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemArgs.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Item Price: ${itemArgs.price}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  } 
}
```
> Output yang dihasilkan:\
![alt text](<../images/GIF 1.gif>)

3. Pada hasil akhir dari aplikasi belanja yang telah anda selesaikan, tambahkan atribut foto produk, stok, dan rating. Ubahlah tampilan menjadi GridView seperti di aplikasi marketplace pada umumnya.
```dart
item.dart

class Item {
  String name;
  int price;
  String image;
  int stock;
  double rating;

  Item({
    required this.name, 
    required this.price,
    required this.image,
    required this.stock,
    required this.rating
    });  
}
```

```dart
homepage.dart

import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, image: 'images/sugar.jpg', stock: 10, rating: 4.5),
    Item(name: 'Salt', price: 2000, image: 'images/salt.jpg', stock: 5, rating: 4.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah Kolom
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(item.image, height: 100, width: double.infinity, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Rp${item.price}', style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text(item.rating.toString(), style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
```

```dart
item_page.dart

import 'package:flutter/material.dart';
import '/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              itemArgs.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              itemArgs.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${itemArgs.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Stock: ${itemArgs.stock}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    if (index < itemArgs.rating.floor()) {
                      // Bintang penuh
                      return const Icon(
                        Icons.star,
                        color: Colors.green,
                        size: 24,
                      );
                    } else if (index < itemArgs.rating) {
                      // Bintang setengah
                      return const Icon(
                        Icons.star_half,
                        color: Colors.green,
                        size: 24,
                      );
                    } else {
                      // Bintang kosong
                      return const Icon(
                        Icons.star_border,
                        color: Colors.green,
                        size: 24,
                      );
                    }
                  }),
                ),
                const SizedBox(width: 8),
                Text(
                  itemArgs.rating.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```
>Hasil Output:\
![alt text](<../images/GIF 2.gif>)
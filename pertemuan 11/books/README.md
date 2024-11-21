# **Praktikum 1: Mengunduh Data dari Web Service (API)**

#### **Langkah 1: Buat Project Baru**
![alt text](image.png)\
Kemudian Tambahkan dependensi ``http`` dengan mengetik perintah berikut di terminal.
![alt text](image-1.png)

#### **Langkah 2: Cek file ``pubspec.yaml``**
```dart
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  http: ^1.2.2
```

#### **Langkah 3: Buka file ``main.dart``**
**Soal 1**\
Tambahkan **nama panggilan Anda** pada ``title`` app sebagai identitas hasil pekerjaan Anda.
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cahyo', // Soal 1
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('Go!'),
            onPressed: () {}, 
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
        ]),
      ),
    );
  }
}
```

#### **Langkah 4: Tambah method ``getData()``**
```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/mpryEAAAQBAJ';

    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```
**Soal 2**\
Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut.
![alt text](image-2.png)

#### **Langkah 5: Tambah kode di ElevatedButton**
Menambahkan kode untuk memanggil method getData() pada ElevatedButton.
```dart
ElevatedButton(
              onPressed: () {
                setState(() {});
                getData().then((value) {
                  result = value.body.toString().substring(0, 450);
                  setState(() {});
                }).catchError((_) {
                  result = 'An error occured';
                  setState(() {});
                });
              },
```
**Soal 3**\
Jelaskan maksud kode langkah 5 tersebut terkait ``substring`` dan ``catchError``!
>Jawab: 
``substring`` digunakan untuk mengambil data dari index tertentu pada string. ``catchError`` digunakan untuk menangkap error yang terjadi pada kode.\
![alt text](GIF(1).gif)

# **Praktikum 2: Menggunakan await/async untuk menghindari callbacks**

#### **Langkah 1: Buka file ``main.dart``**
Tambahkan tiga method berisi kode seperti berikut di dalam class ``_FuturePageState``.
```dart
 Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
```

#### **Langkah 2: Tambah method ``count``**
Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.
```dart
  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
```

#### **Langkah 3: Panggil ``count``**
Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.
```dart
            ElevatedButton(
              // onPressed: () {
              //   // setState(() {});
              //   // getData().then((value) {
              //   //   result = value.body.toString().substring(0, 450);
              //   //   setState(() {});
              //   // }).catchError((_) {
              //   //   result = 'An error occured';
              //   //   setState(() {});
              //   // });
              // },
              child: const Text('Go!'),
              onPressed: () {
                count();
              },
            ),
```
**Soal 4**
* Jelaskan maksud kode langkah 1 dan 2 tersebut!\
Jawab:\
Kode di atas melakukan tiga operasi asynchronous dengan jeda waktu 3 detik untuk setiap fungsi (returnOneAsync, returnTwoAsync, returnThreeAsync). Fungsi count menghitung total hasil dari ketiga fungsi tersebut secara berurutan (serial). Setelah hasil total dihitung, nilai tersebut diperbarui ke dalam state result menggunakan setState, sehingga dapat ditampilkan di UI.

* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 4"**.\
Jawab:\
![alt text](GIF(2).gif)

# **Praktikum 3: Menggunakan Completer di Future**

#### **Langkah 1: Buka ``main.dart``**
Pastikan telah impor package async berikut.
```dart
import 'dart:async';
```

#### **Langkah 2: Tambahkan variabel dan method**
Tambahkan variabel late dan method di class ``_FuturePageState`` seperti ini.
```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

#### **Langkah 3: Ganti isi kode ``onPressed()``**
```dart
onPressed: () {
                // count();
                getNumber().then((value){
                  setState(() {
                    result = value.toString();
                  });
                });
              },
```
**Soal 5**
* Jelaskan maksud kode langkah 2 tersebut!\
Jawab:\
``Completer`` digunakan untuk mengontrol penyelesaian dari sebuah ``Future`` secara manual. Fungsi ``getNumber`` membuat sebuah ``Completer`` dan memulai proses ``calculate``.
``calculate`` menunggu selama 5 detik (``Future.delayed``) lalu menyelesaikan ``Completer`` dengan nilai ``42``.
Dan terakhir nilai ``42`` akan muncul sebagai hasil dari ``completer.future`` setelah proses selesai.

* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan **"W11: Soal 5"**.\
Jawab:\
![alt text](GIF(3).gif)
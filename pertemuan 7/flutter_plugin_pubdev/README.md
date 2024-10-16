# Praktikum Menerapkan Plugin di Project Flutter

### Langkah 1: Buat Project Baru
![alt text](../images/image.png)
### Langkah 2: Menambahkan Plugin
![alt text](../images/image-2.png)
### Langkah 3: Buat file ```red_text_widget.dart```
```dart
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
### Langkah 4: Tambahkan Widget AutoSizeText
```dart
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
```
> Jawab:\
Error pada 'text' dikarenakan belum mendeklarasikan variabel dan parameter.
### Langkah 5: Buat Variabel text dan parameter di constructor
 ```dart 
  final String text;
  const RedTextWidget({Key? key, required this.text}) : super(key: key);
```
### Langkah 6: Tambahkan widget di main.dart
```dart
children: <Widget>[
            Container(
              color: Colors.yellowAccent,
              width: 50,
              child: const RedTextWidget(
                text: 'You have pushed the button this many times:', 
                ),
            ),
            Container(
              color: Colors.greenAccent,
              width: 100,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
```
> Output:\
![alt text](../images/image-3.png)
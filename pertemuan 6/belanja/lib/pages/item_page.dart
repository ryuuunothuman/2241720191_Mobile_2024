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

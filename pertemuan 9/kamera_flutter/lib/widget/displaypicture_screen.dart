import 'package:flutter/material.dart';

import 'package:kamera_flutter/widget/filter_carousel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2241720191')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: PhotoFilterCarousel(filePath: (imagePath)),
    );
  }
}
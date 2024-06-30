import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CroppedImage extends StatefulWidget {
final CroppedFile image;
  const CroppedImage({super.key, required this.image});

  @override
  State<CroppedImage> createState() => _CroppedImageState();
}

class _CroppedImageState extends State<CroppedImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cropped Image", style: TextStyle(fontSize: 21, color: Colors.green, fontWeight: FontWeight.w700),)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InteractiveViewer(
              child: Image(
                image: FileImage(
                  File(widget.image.path),
                ),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'cropped_image.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void pickImage(bool pickGalleryImage)async{
    XFile? image;
    final picker = ImagePicker();

    if (pickGalleryImage == true) {
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await picker.pickImage(source: ImageSource.camera);
    }

    if (image != null) {
      final croppedImage = await cropImages(image);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => CroppedImage(
            image: croppedImage,
          )),
        ),
      );
    }
  }

  Future<CroppedFile> cropImages(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image Cropper',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9,
          ]
        ),
        IOSUiSettings(
          title: 'Crop Image',
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
            ]

        )
      ]
    );

    return croppedFile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Add Image / Icon", style: TextStyle(fontSize: 21, color: Colors.green, fontWeight: FontWeight.w700),)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      width: 1
                  )

              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('Upload Image', style: TextStyle(fontSize: 21, color: Colors.green, fontWeight: FontWeight.w300 ),),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(onPressed: (){
                        pickImage(true);
                      }, style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: Text('Choose from Gallery', style: TextStyle(fontSize: 21, color: Colors.white,fontWeight: FontWeight.w700),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(onPressed: (){
                        pickImage(false);
                      }, style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: Text('Choose from Camera', style: TextStyle(fontSize: 21 , color: Colors.white,fontWeight: FontWeight.w700),)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
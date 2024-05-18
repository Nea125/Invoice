
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';

// Function to compress an image file
Future<File> compressImage(File file) async {
  // Compress the image
  File compressedFile = await FlutterNativeImage.compressImage(
    file.path,
    quality: 70,
    percentage: 100,
  );
  print("Befor Compress : ${file.lengthSync()} Byte");
  print("Affter Compress : ${compressedFile.lengthSync()} Byte");

  // Return the compressed file
  return compressedFile;
}


// Function to save an asset image to the download folder
Future<void> saveAssetImageToDownloadFolder(
    String assetPath, BuildContext context) async {
  try {
    // Read the image data from assets
    ByteData data = await rootBundle.load(assetPath);

    List<int> bytes = data.buffer.asUint8List();//[1,2,4,5,64,3,2]

    // Get the download directory
    Directory? downloadDir = await getExternalStorageDirectory();
    String? downloadPath = downloadDir?.path;

    // Create a unique file name for the file
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String extension = assetPath.split('.').last; // Get the file extension from the asset path

    // Combine the directory path with the file name
    String filePath = '$downloadPath/$fileName.$extension';

    // Write the image data to a file
    File file = File(filePath);
    await file.writeAsBytes(bytes);

    // Compress the image before download
    File compressedFile = await compressImage(file);

    // Move the compressed file to the download directory
    await compressedFile.copy(filePath);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Download Successful..."),
        duration: Duration(seconds: 2),
      ),
    );

    print("Download Success.....");
    print("Image Path : $filePath");
    print("Extension: $extension");
    
  } catch (e) {
    // Handle errors
    print('Error saving file: $e');
  }
}



// ignore: must_be_immutable
class DownLoadImage extends StatelessWidget {
 DownLoadImage({super.key});
  File? fileCompress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/messenger.jpeg"))
                ),
            ),
          ),

          Center(
          child: IconButton(
            onPressed: () {
             saveAssetImageToDownloadFolder("assets/images/messenger.jpeg",context);
            },
            icon: const Icon(Icons.download),
          ),
        ),
        ],
      ),
    );
  }
}










import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

    Future<File> compressImage(File file) async {
  // Compress the image
      File compressedFile = await FlutterNativeImage.compressImage(
        file.path,
        quality: 70,
        percentage: 70,
      );

  // Return the compressed file
  return compressedFile;
}
Future<void> convertAssetImageToPdf(String assetPath) async {
  try {
    // Load the image data from the asset
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();

    // Decode the image data
    final image = img.decodeImage(bytes as Uint8List);
    if (image == null) {
      throw Exception("Error decoding image");
    }

    // Create a PDF document
    final pdf = pw.Document();

    // Add the image to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              pw.MemoryImage(img.encodeJpg(image)),
            ),
          );
        },
      ),
    );
    Directory? downloadDir = await getExternalStorageDirectory();
    var status = await Permission.storage.request();
    if(status.isGranted)
    {
        String oldPath;
        String newPath;
        if (downloadDir != null) {
           oldPath = downloadDir.path; // Get the current path
            newPath = oldPath.replaceAll(
              "/storage/emulated/0/Android/data/com.example.ceatechart/files",
              "/storage/emulated/0/Download");
                  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
                  String filePath = '$newPath/$fileName';
                 // Combine the directory path with the file name
           filePath = '$newPath/$fileName';
       
          print(" New Path : ${newPath}");
            // Write the image data to a file
           File file = File(filePath);
          await file.writeAsBytes(bytes);

          // Compress the image before download
          File compressedFile = await compressImage(file);

          // Move the compressed file to the download directory
          await compressedFile.copy(filePath);
              // Save the PDF document to the file
        }
    }

    


   
  } catch (e) {
    print("Error converting image to PDF: $e");
  }
}

class ConvertToPDF extends StatelessWidget {
  const ConvertToPDF({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await convertAssetImageToPdf("assets/images/car.jpg");
          },
          child: const Text('Convert Image to PDF'),
        ),
      ),
    );
  }
}


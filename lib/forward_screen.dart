// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

String? filePath;

class ForWardScreen extends StatefulWidget {
  const ForWardScreen({super.key});

  @override
  State<ForWardScreen> createState() => _ForWardScreenState();

  get getFilePath => filePath;
}

class _ForWardScreenState extends State<ForWardScreen> {
  @override
  void initState() {
    super.initState();
  }

// final Uri _url = Uri.parse('tg://resolve?domain=nuneaRTK');
  final Uri _url =
      Uri.parse('tg://resolve?domain=joinchat/https://t.me/neaRTK');
  ForWardScreen screen = const ForWardScreen();

  Future<void> _launchUrl() async {
    // ignore: deprecated_member_use
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    } else {
      // ignore: deprecated_member_use
      await launch(
        _url.toString(),
      );
    }
  }

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

  Future<void> saveAssetImageToDownloadFolder(
      String assetPath, BuildContext context) async {
    try {
      // Read the image data from assets
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List(); //[1,2,4,5,64,3,2]

      Directory? downloadDir = await getExternalStorageDirectory();
      // request permission to open directory
      var status = await Permission.storage.request();
      if (status.isGranted) {
        String oldPath;
        String newPath;
        if (downloadDir != null) {
          oldPath = downloadDir.path; // Get the current path
          newPath = oldPath.replaceAll(
              "/storage/emulated/0/Android/data/com.example.ceatechart/files",
              "/storage/emulated/0/Download");
          // Create a unique file name for the file
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          String extension = assetPath
              .split('.')
              .last; // Get the file extension from the asset path

          // Combine the directory path with the file name
          filePath = '$newPath/$fileName.$extension';

          print(" New Path : ${newPath}");
          // Write the image data to a file
          File file = File(filePath!);
          await file.writeAsBytes(bytes);

          // Compress the image before download
          File compressedFile = await compressImage(file);

          // Move the compressed file to the download directory
          await compressedFile.copy(filePath!);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Download Successful..."),
              duration: Duration(seconds: 2),
            ),
          );
          try {
            await Directory(oldPath).rename(newPath);

            print('Directory name changed successfully.');
          } catch (e) {
            print('Error: $e');
          }
        } else {
          print('Error: Could not get the external storage directory.');
        }
      } else {
        print("Permission died");
      }

      // print("Download Success.....");

      print("Image Path : $filePath");
      // print("Extension: $extension");
    } catch (e) {
      // Handle errors

      print('Error saving file: $e');
    }
  }

// ignore: non_constant_identifier_names
  String Token = "6429150207:AAEBlmyTIaQVtGpar0MfE5ua8n2IvXPdGw4";

  String chartID = "913903871";

  Future<void> sendImageToTelegram(String chatId, String botToken) async {
    try {
      // Get the directory where the app can store files

      // Construct the path to the image file
      filePath = screen.getFilePath();

      if (filePath == null) {
        print('Error: Image file path is null.');
        return;
      }

      // Check if the image file exists
      File imageFile = File(screen.getFilePath);
      if (!imageFile.existsSync()) {
        print('Error: Image file not found at ${screen.getFilePath}');
        return;
      }

      // Prepare the request payload
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://api.telegram.org/bot$botToken/sendPhoto'));
      request.fields['chat_id'] = chatId;

      // Add the image file to the request
      request.files.add(await http.MultipartFile.fromPath('photo', filePath!));

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        print('Image sent to Telegram successfully.');
      } else {
        print(
            'Failed to send image to Telegram. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending image to Telegram: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Foward Screen"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/car.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/car.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 1), () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext cxt) {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        height: 400,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                                "assets/images/car.jpg"),
                                            const SizedBox(width: 16),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.only(
                                right: 15, bottom: 20, left: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.32,
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0),
                              color: Colors.transparent,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 27,
                                        child: GestureDetector(
                                          onTap: () {
                                            saveAssetImageToDownloadFolder(
                                                "assets/images/car.jpg",
                                                context);
                                            _launchUrl();
                                            sendImageToTelegram(chartID, Token);
                                          },
                                          child: const Icon(Icons.telegram,
                                              size: 50, color: Colors.blue),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    icon: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        )),
                  )),
              const Positioned(right: 18, top: 44, child: Text("Share"))
            ],
          )
        ],
      ),
    );
  }
}

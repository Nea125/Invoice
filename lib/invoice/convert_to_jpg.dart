// ignore_for_file: unnecessary_brace_in_string_interps
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class InvoiceJPG extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();
  // DateTime currendate = DateTime.now();
  String formattedDate = DateFormat('dd MMM yyyy').format(DateTime.now());
  // Future<void> launchUrl() async {
  //   final Uri url =
  //       // Uri.parse('https://t.me/neaRTK');
  //       Uri.parse(
  //     "https://t.me/manymorng",
  //   );
  //   // Uri.parse('https://t.me/manymorng');
  //   // ignore: deprecated_member_use
  //   if (!await canLaunch(url.toString())) {
  //     throw Exception('Could not launch $url');
  //   } else {
  //     // ignore: deprecated_member_use
  //     await launch(
  //       url.toString(),
  //     );
  //     // ignore: avoid_print
  //     print("Contact Success....");
  //   }
  // }

  // Future<void> launchUrl() async {
  //   final Uri url = Uri.parse('tg://resolve?domain=manymorng');

  //   if (!await canLaunch(url.toString())) {
  //     throw Exception('Could not launch $url');
  //   } else {
  //     await launch(url.toString());
  //     print("Contact Success....");
  //   }
  // }

  Future<void> share(GlobalKey globalKey, BuildContext context) async {
    try {
      // Wait for the current frame to finish rendering
      await Future.delayed(Duration.zero);
      final currentContext = globalKey.currentContext;
      if (currentContext != null) {
        RenderRepaintBoundary boundary =
            // ignore: use_build_context_synchronously
            currentContext.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          Uint8List pngBytes = byteData.buffer.asUint8List();

          final directory = await getExternalStorageDirectory();
          final imageFile = File('${directory!.path}/invoice.jpg');
          await imageFile.writeAsBytes(pngBytes);

          // Share the image using flutter_share
          // ignore: use_build_context_synchronously
          final RenderBox box = context.findRenderObject() as RenderBox;
          final topLeft = box.localToGlobal(Offset.zero);
          final bottomRight =
              box.localToGlobal(box.size.bottomRight(Offset.zero));
          final sharingRect = Rect.fromPoints(topLeft, bottomRight);
          Share.shareXFiles(
            [XFile(imageFile.path)],
            text: "Invoice",
            subject: "Delivery",
            sharePositionOrigin: sharingRect,
            // Disable default system dialog
          );
          // ignore: avoid_print
          print("Shared to Telegram");
        } else {}
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print("Rect :${e}");
    }
  }

  Future<void> shareToTelegram(
      GlobalKey globalKey, BuildContext context) async {
    // String telegramUrl =
    //     "https://t.me/manymorng/share/url?url=$telegramBaseUrl&text=Welcome:";
    String telegramUrl = "https://t.me/manymorng/share/url?url&text=Welcome";
    // ignore: deprecated_member_use
    if (await canLaunch(telegramUrl)) {
      // ignore: deprecated_member_use
      await launch(telegramUrl);
      print("Shared to Telegram");
    } else {
      print("Could not launch Telegram");
    }
  }

  static barCode() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarcodeWidget(
        barcode: Barcode.code128(),
        data: '1234567894567888',
        width: 150,
        height: 40,
      ),
    );
  }

  Future<void> _captureAndSave(BuildContext context) async {
    try {
      // Wait for the current frame to finish rendering
      await Future.delayed(Duration.zero);
      final currentContext = _globalKey.currentContext;
      if (currentContext != null) {
        RenderRepaintBoundary boundary =
            // ignore: use_build_context_synchronously
            currentContext.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          Uint8List pngBytes = byteData.buffer.asUint8List();

          final directory = await getExternalStorageDirectory();
          final imageFile = File('${directory!.path}/invoice.jpg');
          await imageFile.writeAsBytes(pngBytes);
          print("${imageFile}");
        } else {}
      } else {}
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            'Download',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                RepaintBoundary(
                  // block of convertd
                  key: _globalKey,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/del.png')),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10)),
                                ),
                              ),
                              barCode()
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("អ្នកដឹក​: Rous Sambat"),
                              Text("កាលបរិច្ឆេទ​​​ :  $formattedDate")
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("អ្នកផ្ញើរ : Super Sales ABC"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("លេខទូរស័ព្ទ : 0977479956"),
                          const Text("12323"),
                          const SizedBox(
                            height: 40,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("លេខទូរស័ព្ទ :"),
                              Text("0977479956"),
                              Text("តម្លៃឥវ៉ាន់ :"),
                              Text("12\$")
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("           ទីតាំង :"),
                              Text("          អូរឫស្សីទី១"),
                              Text("    សេវាកម្ម :"),
                              Text("ធម្មតា")
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              Text("                    តម្លៃសរុប : "),
                              Text(""),
                              Text("12\$"),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            '''ចំណាំរាល់ទំនិញខុសច្បាប់ម្ចាស់ទំនិញត្រូវទទួលខុសត្រូវចំពោះមុខច្បាប់ដោយខ្លួនឯងក្រុមហ៊ុនមិនទទួលខុសត្រូវឡើយ។​សូមអគុណចំពោះការប្រើប្រាស់សេវាកម្មយើងខ្ញុំ''',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/del.png')),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10)),
                                ),
                              ),
                              barCode()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await _captureAndSave(context);
                      },
                      child: const Text("Download"),
                    ),
                    GestureDetector(
                      onTap: () {
                        // launchUrl();
                      },
                      child: const CircleAvatar(
                          child: Icon(
                        Icons.telegram,
                        size: 40,
                        color: Colors.blue,
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        // launchUrl();
                        shareToTelegram(_globalKey, context);

                        // Future.delayed(const Duration(seconds: 5), () {
                        //   share(_globalKey, context);

                        //   // ignore: avoid_print-, avoid_print
                        //   print("Share");
                        // });
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.share),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();

  Test({super.key});

  Future<void> launchUrlAndShare(BuildContext context) async {
    final Uri url = Uri.parse('https://t.me/manymorng');

    // ignore: deprecated_member_use
    if (!await canLaunch(url.toString())) {
      throw Exception('Could not launch $url');
    }

    try {
      await launch(url.toString());
      await Future.delayed(Duration(seconds: 2)); // Wait for Telegram to open
      await shareScreenshot(context);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> shareScreenshot(BuildContext context) async {
    try {
      final RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        final Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = await getTemporaryDirectory();
        final imageFile = File('${directory.path}/invoice.jpg');
        await imageFile.writeAsBytes(pngBytes);

        final RenderBox box = context.findRenderObject() as RenderBox;
        final topLeft = box.localToGlobal(Offset.zero);
        final bottomRight =
            box.localToGlobal(box.size.bottomRight(Offset.zero));
        final sharingRect = Rect.fromPoints(topLeft, bottomRight);

        // ignore: deprecated_member_use
        await Share.shareFiles(
          [imageFile.path],
          text: "Invoice",
          subject: "Delivery",
          sharePositionOrigin: sharingRect,
        );

        print("Image shared to Telegram");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Widget"),
      ),
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: Test(), // Your widget that you want to capture
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => launchUrlAndShare(context),
        child: const Icon(Icons.share),
      ),
    );
  }
}

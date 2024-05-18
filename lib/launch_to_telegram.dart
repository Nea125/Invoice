import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class UrlLauncher extends StatelessWidget {
   UrlLauncher({super.key});
  
  @override
  final Uri _url = Uri.parse('https://t.me/nuneaRTK');
  Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("URL LUANCHER"),
      ),
      body:  Center(
            child: ElevatedButton(
              onPressed: _launchUrl,
              child: const Text('Show Flutter homepage'),
            ),
          ),
    );
  }
}
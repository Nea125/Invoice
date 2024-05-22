// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelegramBot extends StatefulWidget {
  const TelegramBot({super.key});
  @override
  State<TelegramBot> createState() => TelegramBotState();
}

class TelegramBotState extends State<TelegramBot> {
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();
  void clear() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Telegram"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  sendMessageToTelegramBot(controller.text);
                  setState(() {
                    clear();
                  });
                },
                child: const Text("Send"))
          ],
        ),
      ),
    );
  }
}

void sendMessageToTelegramBot(String message) async {
  // final apiUrl = Uri.parse(
  //     "https://api.telegram.org/bot6198612919:AAHBmXAPL8E6BJh3XXuGUnwmXfsWGFO-iIY/sendMessage");
  final apiUrl = Uri.parse(
      "https://api.telegram.org/bot7018818930:AAHOs2pxE4lMa7VcpbZ3eCNdQSCzIRWEIcA/sendMessage");

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  String requestBody = '{"chat_id": "913903871", "text": "$message"}';
  try {
    http.Response response =
        await http.post(apiUrl, headers: headers, body: requestBody);
    if (response.statusCode == 200) {
      print("Message sent successfully!");
    } else {
      print("Failed to send message. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error sending message: $e");
  }
}

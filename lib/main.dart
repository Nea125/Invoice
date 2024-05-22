import 'package:ceatechart/Telegram/telegram_bot.dart';
import 'package:ceatechart/invoice/convert_to_jpg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InvoiceJPG(),
    );
  }
}



// This is for bluetooth print




// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:ceatechart/printer/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.bottom]);
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         systemNavigationBarColor: Color.fromARGB(0, 255, 255, 255)));
//     return DarkLightTheme();
//   }
// }




// class DarkLightTheme extends StatefulWidget {
//   const DarkLightTheme({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DarkLightTheme> createState() => _DarkLightThemeState();
// }

// class _DarkLightThemeState extends State<DarkLightTheme> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:  HomePage(),
//     );
//   }
// }


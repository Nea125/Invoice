// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// class ShareToTelegram extends StatefulWidget {
//  const ShareToTelegram({super.key});
//   @override
//   State<ShareToTelegram> createState() => _HomePageState();
// }
// class _HomePageState extends State<ShareToTelegram> {
//   final List<Map<String, dynamic>> data = [
//     {'title': 'Cadbury Dairy Milk', 'price': 15, 'qty': 2},
//     {'title': 'Parle-G Gluco Biscut', 'price': 5, 'qty': 5},
//     {'title': 'Fresh Onion - 1KG', 'price': 20, 'qty': 1},
//     {'title': 'Fresh Sweet Lime', 'price': 20, 'qty': 5},
//     {'title': 'Maggi', 'price': 10, 'qty': 5},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 33, 33, 33),
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Share In Flutter'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//           child: ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context,index) {
//               return Column(
//                 children: [
//                   Container(
//                     // ignore: sort_child_properties_last
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: ClipRRect(// Importance
//                             borderRadius: BorderRadius.circular(25),
//                             child: SizedBox(
//                               height: 400,
//                               width: 400,
//                               child: Image.network(
//                                 'https://images.unsplash.com/photo-1523395555535-a43123287dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           )
//                           ),
//                         const Padding(
//                           padding: EdgeInsets.all(30.0),
//                           child: Text(
//                             'Beautiful Subway',
//                             style: TextStyle(fontSize: 25, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                     width: 350,
//                     height: 500,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(blurRadius: 12, color: Colors.grey.shade900)
//                         ],
//                         color: const Color.fromARGB(255, 62, 62, 62),
//                         borderRadius: BorderRadius.circular(25)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(25.0),
//                     child: SizedBox(
//                         width: 190,
//                         height: 50,
//                         child: ElevatedButton(
//                           // ignore: sort_child_properties_last
//                           child: const Text(
//                             'Send',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                           ),
//                           onPressed: () async {

//                             // Share Image to Social Media
//                             const urlPreview =
//                                 'https://images.unsplash.com/photo-1523395555535-a43123287dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
//                             final url = Uri.parse(urlPreview);
//                      ​​​​​      final response = await http.get(url);
//                             final bytes = response.bodyBytes;

//                             final temp = await getTemporaryDirectory();
//                             final path = '${temp.path}/image.png';// pdf exstension convert image to pdf
//                             File(path).writeAsBytesSync(bytes);
//                             // ignore: deprecated_member_use
//                             await Share.shareFiles([path],
//                                 text: 'Hey, Look, so beautiful');
//                           },
//                         )),
//                   )
//                 ],
//               );
//             }
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class ShareToTelegram extends StatefulWidget {
  const ShareToTelegram({super.key});
  @override
  State<ShareToTelegram> createState() => _HomePageState();
}
class _HomePageState extends State<ShareToTelegram> {
  final List<Map<String, dynamic>> data = [
    {'title': 'Cadbury Dairy Milk', 'price': 15, 'qty': 2},
    {'title': 'Parle-G Gluco Biscut', 'price': 5, 'qty': 5},
    {'title': 'Fresh Onion - 1KG', 'price': 20, 'qty': 1},
    {'title': 'Fresh Sweet Lime', 'price': 20, 'qty': 5},
    {'title': 'Maggi', 'price': 10, 'qty': 5},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Share In Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Text("${data[index]["title"]}"),
                    title:  Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text("${data[index]["qty"]}"),
                    ),
                    trailing: Text("${data[index]["price"]}\$"),
                  )
                ],
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              // ignore: sort_child_properties_last
              child: const Text(
                'Send',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () async {
                // Share Image to Social Media
                const urlPreview =
                    'https://images.unsplash.com/photo-1523395555535-a43123287dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
                final url = Uri.parse(urlPreview);
                final response = await http.get(url);
                final bytes = response.bodyBytes;
                final temp = await getTemporaryDirectory();
                final path =
                    '${temp.path}/image.png'; // pdf exstension convert image to pdf
                File(path).writeAsBytesSync(bytes);
                // ignore: deprecated_member_use
                await Share.shareFiles([path], text: 'This is Image');
              },
            )),
      ),
    );
  }
}

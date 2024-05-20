import 'package:flutter/material.dart';
class BottomTest extends StatefulWidget {
  const BottomTest({super.key});

  @override
  State<BottomTest> createState() => _BottomTestState();
}

class _BottomTestState extends State<BottomTest> {
  int selectediIndex =0;
  List item = [
    const Center(
      child: Text("Seeting"),
    ),
     const Center(
       child: Text("Home"),
     ),
     const Center(
       child: Text("Profile"),
     ),
     const Center(
       child: Text("Messege"),
     ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BottomNavigationBar"),
      ),
      body: item[selectediIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: selectediIndex,
        onTap: (index){
          setState(() {
            selectediIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.settings),label: "Setting"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message")
        ],
      ),
    );
  }
}
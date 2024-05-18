import 'package:ceatechart/into_messanger.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(44, 0, 0, 0),
      appBar: AppBar(
        // automaticallyImplyLeading:
        //     false, // this will hide Drawer hamburger icon , hide drawer icon
        elevation: 0,
        leading: Stack(
          children: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color.fromARGB(112, 158, 158, 158),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            const Positioned(
              top: 5,
              right: 8,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
              ),
            )
          ],
        ),

        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(44, 0, 0, 0),
        title: Row(
          children: [
            const SizedBox(width: 20),
            const Text(
              'Charts',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(112, 158, 158, 158),
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(115, 158, 158, 158),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/robot.jpeg"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Today is ",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/robot.jpeg"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Today is ",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/robot.jpeg"),
                              ),
                              const Positioned(
                                right: 5,
                                bottom: 4,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Today is ",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Vireak",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: prefer_const_constructors
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Hello World");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntoMessanger()));
                      },
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/logan.jpeg"),
                            radius: 25,
                            backgroundColor: Colors.blue,
                          ),
                          const SizedBox(width: 20),
                          const Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Logan",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "send message 8:30",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.check,
                              size: 12,
                              weight: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logan.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "send message 8:30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            weight: 100,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.9),
        shadowColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Kok Dara',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Stack(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                            top: 1,
                            right: 2,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * (0.66),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(87, 158, 158, 158),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.maps_ugc),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Chart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.storefront),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Market Place",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.sms),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Message request",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.inventory_2),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Archive",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle:
            const TextStyle(color: Colors.white, fontSize: 14),
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.maps_ugc,
                color: Colors.white,
              ),
              label: 'Chart',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              label: 'People',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.facebook,
                color: Colors.white,
              ),
              label: 'Stories',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}

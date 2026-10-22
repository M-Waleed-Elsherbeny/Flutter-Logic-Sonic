import 'package:flutter/material.dart';

class SingleSelectionScreen extends StatefulWidget {
  const SingleSelectionScreen({super.key});

  @override
  State<SingleSelectionScreen> createState() => _SingleSelectionScreenState();
}

class _SingleSelectionScreenState extends State<SingleSelectionScreen> {
  List<Map<String, String>> items = [
    {"image": "assets/animals/cow.png", "name": "Cow"},
    {"image": "assets/animals/deer.png", "name": "Deer"},
    {"image": "assets/animals/giraffe.png", "name": "Giraffe"},
    {"image": "assets/animals/lion.png", "name": "Lion"},
    {"image": "assets/animals/penguin.png", "name": "Penguin"},
    {"image": "assets/animals/rat.png", "name": "Rat"},
    {"image": "assets/animals/tiger.png", "name": "Tiger"},
    {"image": "assets/animals/white-tiger.png", "name": "White Tiger"},
  ];

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 30,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Stack(
              children: [
                // Background container
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black12, Colors.black87, Colors.black12],
                    ),
                  ),
                ),

                // Image and name
                Column(
                  children: [
                    Image.asset(
                      "${items[index]["image"]}",
                      height: selectedIndex == index ? 125 : 95,
                      width: 300,
                    ),
                    selectedIndex == index
                        ? SizedBox.shrink()
                        : Text(
                            "${items[index]["name"]}".toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),

                // Select button
                selectedIndex == index
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "SELECT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}

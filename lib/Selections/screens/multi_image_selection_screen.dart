import 'package:flutter/material.dart';

class MultiImageSelectionScreen extends StatefulWidget {
  const MultiImageSelectionScreen({super.key});

  @override
  State<MultiImageSelectionScreen> createState() =>
      _MultiImageSelectionScreenState();
}

class _MultiImageSelectionScreenState extends State<MultiImageSelectionScreen> {
  List<String> images = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop4.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop3.png",
  ];

  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFEEE00),
      child: Column(
        children: [
          Image.asset(
            images[selectedImageIndex],
            width: double.infinity,
            height: 500,
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedImageIndex == index
                            ? Colors.blue
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

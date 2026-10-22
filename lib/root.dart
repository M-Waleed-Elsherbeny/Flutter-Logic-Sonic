import 'package:flutter/material.dart';
import 'package:logic_with_sonic/Selections/screens/multi_image_selection_screen.dart';
import 'package:logic_with_sonic/Selections/screens/multi_selections.dart';
import 'package:logic_with_sonic/Selections/screens/single_selection_screen.dart';
import 'package:logic_with_sonic/Selections/screens/toggle_selection_screen.dart';

class MainRoot extends StatefulWidget {
  const MainRoot({super.key});

  @override
  State<MainRoot> createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  final PageController controller = PageController();
  List<Widget> pages = [
    SingleSelectionScreen(),
    MultiImageSelectionScreen(),
    ToggleSelectionScreen(),
    MultiSelections(),

  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          "Next Page",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

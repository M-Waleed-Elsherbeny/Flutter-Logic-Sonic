import 'package:flutter/material.dart';

class MultiSelections extends StatefulWidget {
  const MultiSelections({super.key});

  @override
  State<MultiSelections> createState() => _MultiSelectionsState();
}

class _MultiSelectionsState extends State<MultiSelections> {
  List<String> options = [
    "News",
    "Sports",
    "Technology",
    "Health",
    "Science",
    "Business",
    "Travel",
    "Food",
  ];

  int? selectedIndex;
  List<int> selectedIndices = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
            'What do you want to see in X?',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),

          Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(
              options.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    if (selectedIndices.contains(index)) {
                      selectedIndices.remove(index);
                    } else {
                      selectedIndices.add(index);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndices.contains(index)
                        ? Colors.blue
                        : Colors.black,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    options[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

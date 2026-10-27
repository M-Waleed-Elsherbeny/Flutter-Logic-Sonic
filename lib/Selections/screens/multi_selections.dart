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

  Set<String> selectedOptions = {};
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
            children: List.generate(options.length, (index) {
              final option = options[index];
              final bool isSelectedOption = selectedOptions.contains(option);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelectedOption
                        ? selectedOptions.remove(option)
                        : selectedOptions.add(option);
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelectedOption
                        ? Colors.blue
                        : Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: isSelectedOption
                          ? FontWeight.bold
                          : FontWeight.w400,
                      fontSize: isSelectedOption ? 18 : 16,
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 50),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: selectedOptions.map((e) {
              return AnimatedContainer(
                duration: Duration(microseconds: 800),
                curve: Curves.bounceIn,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

class ToggleSelectionScreen extends StatefulWidget {
  const ToggleSelectionScreen({super.key});

  @override
  State<ToggleSelectionScreen> createState() => _ToggleSelectionScreenState();
}

class _ToggleSelectionScreenState extends State<ToggleSelectionScreen> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/sonic.png'),
            ),
            Positioned(
              bottom: -20,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowed = !isFollowed;
                    log('isFollowed: $isFollowed');
                  });
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: isFollowed ? Colors.green : Colors.blue,
                  child: Icon(
                    isFollowed ? Icons.check : Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isFollowed ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Subscribe Sonic',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

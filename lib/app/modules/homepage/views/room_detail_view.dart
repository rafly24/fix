// lib/app/views/room_detail_view.dart
import 'package:flutter/material.dart';

class RoomDetailView extends StatelessWidget {
  final String roomTitle;
  final String price;
  final String description;
  final List<String> imagePaths;

  const RoomDetailView({
    Key? key,
    required this.roomTitle,
    required this.price,
    required this.description,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(description),
            // Add more UI components as needed
          ],
        ),
      ),
    );
  }
}
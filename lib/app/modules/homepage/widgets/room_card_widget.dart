import 'package:flutter/material.dart';

class RoomCardWidget extends StatelessWidget {
  final String imagePath;
  final String roomTitle;
  final String price;
  final String description;

  const RoomCardWidget({
    Key? key,
    required this.imagePath,
    required this.roomTitle,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF5F5F5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150,
            ),
            const SizedBox(height: 10),
            Text(
              roomTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
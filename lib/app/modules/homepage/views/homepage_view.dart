import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you are using GetX for navigation
import '../models/kos_models.dart';

class KosListItem extends StatelessWidget {
  final KosModel kos;

  const KosListItem({Key? key, required this.kos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kos List'),
      ),
      body: GestureDetector(
        onTap: () {
          // Navigate to detail page
          // Get.toNamed('/kos-detail', arguments: kos);
        },
        child: Card(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(kos.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kos.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(kos.location),
                    Text(kos.facilities.join(' - ')),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(kos.rating.toString()),
                      ],
                    ),
                    Text('${kos.price}/bln', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        currentIndex: 2, // Set initial index to chat icon
        type: BottomNavigationBarType.fixed, // Type of BottomNavigationBar
        onTap: (index) {
          if (index == 3) { // Index 3 is the profile icon
            Get.toNamed('/profile'); // Navigate to profile page
          }
          // Handle other indices as necessary
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''), // Search icon
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''), // Home icon
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''), // Chat icon
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''), // Profile icon
        ],
      ),
    );
  }
}
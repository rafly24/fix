import 'package:flutter/material.dart';
import '../controllers/room_detail_controller.dart';

class RoomDetailWidgets extends StatelessWidget {
  final RoomDetailController controller;

  const RoomDetailWidgets({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add your widget code here
        Text('Price: ${controller.price.value}'),
        Text('Description: ${controller.description.value}'),
      ],
    );
  }
}
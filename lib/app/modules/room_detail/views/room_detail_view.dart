import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/room_detail_controller.dart';
import '../widgets/room_detail_widgets.dart';

class RoomDetailView extends StatelessWidget {
  final RoomDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.roomTitle.value),
      ),
      body: RoomDetailWidgets(controller: controller),
    );
  }
}
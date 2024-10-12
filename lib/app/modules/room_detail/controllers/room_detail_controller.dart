import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  // Define your properties and methods here
  // Example:
  var roomTitle = ''.obs;
  var price = ''.obs;
  var description = ''.obs;

  void updateRoomDetails(String title, String price, String description) {
    roomTitle.value = title;
    this.price.value = price;
    this.description.value = description;
  }
}
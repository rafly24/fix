import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  // Tambahkan variabel yang dibutuhkan
  var imageUrl = ''.obs;
  var title = ''.obs;
  var price = ''.obs;
  var description = ''.obs;
  var isFavorite = false.obs;
  var isShareMenuVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi data dari arguments
    if (Get.arguments != null) {
      title.value = Get.arguments['name'] ?? '';
      price.value = Get.arguments['price']?.toString() ?? '';
      description.value = Get.arguments['description'] ?? '';
      imageUrl.value = Get.arguments['imageUrl'] ?? '';
    } else {
      // Data default jika tidak ada arguments
      title.value = 'Kos Dekat UGM';
      price.value = '1.500.000';
      description.value = 'Kamar kos nyaman dekat kampus UGM';
      imageUrl.value = ''; // URL gambar default jika ada
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleShareMenu() {
    isShareMenuVisible.value = !isShareMenuVisible.value;
  }
}
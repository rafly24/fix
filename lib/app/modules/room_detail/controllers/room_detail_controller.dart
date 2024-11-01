import 'package:get/get.dart';
class RoomDetailController extends GetxController {
  var imageUrl = ''.obs;
  var title = ''.obs;
  var price = ''.obs;
  var description = ''.obs;
  var isFavorite = false.obs;
  var isShareMenuVisible = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleShareMenu() {
    isShareMenuVisible.value = !isShareMenuVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi data
    imageUrl.value = 'URL_GAMBAR_KAMAR';
    title.value = 'Kos Dekat UGM';
    price.value = '1.500.000';
    description.value = 'Deskripsi kamar kos...';
  }
}
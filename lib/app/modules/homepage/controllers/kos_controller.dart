import 'package:get/get.dart';
import '../models/kos_models.dart';

class HomepageController extends GetxController {
  var kosList = <KosModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchKos();
  }

  void fetchKos() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    kosList.value = [
      KosModel(
        name: 'Kos Putri BCT',
        location: 'BCT',
        facilities: ['Wifi', 'Meja', 'Lemari', 'Kasur'],
        rating: 4.9,
        price: 500000,
        imageUrl: 'https://example.com/kos1.jpg',
      ),
      // Add more KosModel objects here
    ];
    isLoading.value = false;
  }
}
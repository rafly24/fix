import 'package:get/get.dart';

class ChatPemilikController extends GetxController {
  var messages = <ChatMessage>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    // Menambahkan pesan awal
    messages.add(
      ChatMessage(
        text: "Hi, saya tertarik dengan kos anda",
        isMe: true,
        timestamp: DateTime.now()
      )
    );
  }
  
  void sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      messages.add(
        ChatMessage(
          text: text,
          isMe: true,
          timestamp: DateTime.now()
        )
      );
    }
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}
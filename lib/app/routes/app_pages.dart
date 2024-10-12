// lib/app/routes/app_pages.dart

import 'package:get/get.dart';
import '../modules/chats/views/chat_view.dart';
import '../modules/not_paid_bills/view/not_paid_bills_view.dart';
import '../modules/paid_bills/view/paid_bills_view.dart';
import '../modules/personal_info/view/personal_info_view.dart';
import '../modules/profile/view/profile_view.dart';
import '../modules/riwayat_kost/view/riwayat_kost_view.dart';
import '../modules/riwayat_kost_none/view/riwayat_kost_none_view.dart';
import '../modules/settings/view/settings_view.dart';
import '../modules/transaction_history/view/transaction_history_view.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/room_detail/views/room_detail_view.dart';
import '../modules/homepage/views/homepage_view.dart';
import 'app_routes.dart';

// Import semua views


// Import semua bindings
import '../modules/not_paid_bills/bindings/not_paid_bills_binding.dart';
import '../modules/paid_bills/bindings/paid_bills_binding.dart';
import '../modules/chats/bindings/chat_binding.dart';
import '../modules/room_detail/bindings/room_detail_binding.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/personal_info/bindings/personal_info_binding.dart';
import '../modules/riwayat_kost_none/bindings/riwayat_kost_none_binding.dart';
import '../modules/riwayat_kost/bindings/riwayat_kost_binding.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/transaction_history/bindings/transaction_history_binding.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.NOT_PAID_BILLS,
      page: () => NotPaidBillsView(),
      binding: NotPaidBillsBinding(),
    ),
    GetPage(
      name: AppRoutes.PAID_BILLS,
      page: () => PaidBillsView(),
      binding: PaidBillsBinding(),
    ),
    GetPage(
      name: AppRoutes.CHATS,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_INFO,
      page: () => PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.RIWAYAT_KOST_NONE,
      page: () => RiwayatKostNoneView(),
      binding: RiwayatKostNoneBinding(),
    ),
    GetPage(
      name: AppRoutes.RIWAYAT_KOST,
      page: () => RiwayatKostView(),
      binding: RiwayatKostBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.TRANSACTION_HISTORY,
      page: () => TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
     GetPage(
      name: AppRoutes.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: AppRoutes.ROOM_DETAIL,
      page: () => RoomDetailView(),
      binding: RoomDetailBinding(),
    ),
     GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => KosListItem(),
      binding: KosBinding(),
    ),
  ];
}
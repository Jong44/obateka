import 'package:get/get.dart';
import 'package:obateka/app/bindings/detail-bindings/chat_bot_binding.dart';
import 'package:obateka/app/bindings/detail-bindings/detail_obat_binding.dart';
import 'package:obateka/app/bindings/detail-bindings/notifikasi_binding.dart';
import 'package:obateka/app/bindings/detail-bindings/obateka_binding.dart';
import 'package:obateka/app/bindings/detail-bindings/qr_binding.dart';
import 'package:obateka/app/bindings/detail-bindings/resep_obat_binding.dart';
import 'package:obateka/app/bindings/main-bindings/home_binding.dart';
import 'package:obateka/app/bindings/main-bindings/login_binding.dart';
import 'package:obateka/app/bindings/main-bindings/splash_binding.dart';
import 'package:obateka/app/pages/detail-page/chat_bot_page.dart';
import 'package:obateka/app/pages/detail-page/detail_obat_page.dart';
import 'package:obateka/app/pages/detail-page/notifikasi_page.dart';
import 'package:obateka/app/pages/detail-page/obateka_page.dart';
import 'package:obateka/app/pages/detail-page/qr_page.dart';
import 'package:obateka/app/pages/detail-page/resep_obat_page.dart';
import 'package:obateka/app/pages/main-page/auth-page/login_page.dart';
import 'package:obateka/app/pages/main-page/main-index-page/home_page.dart';
import 'package:obateka/app/pages/main-page/splash_page.dart';
import 'package:obateka/app/routes/app_router.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.OBATEKA,
      page: () => const ObatekaPage(),
      transition: Transition.fadeIn,
      binding: ObatekaBinding(),
    ),
    GetPage(
      name: Routes.RESEP_OBAT,
      page: () => const ResepObatPage(),
      transition: Transition.fadeIn,
      binding: ResepObatBinding(),
    ),
    GetPage(
      name: Routes.QR_CODE,
      page: () => const QrPage(),
      transition: Transition.fadeIn,
      binding: QrBinding(),
    ),
    GetPage(
      name: Routes.NOTIFIKASI,
      page: () => const NotifikasiPage(),
      transition: Transition.fadeIn,
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_OBAT,
      page: () => const DetailObatPage(),
      transition: Transition.fadeIn,
      binding: DetailObatBinding(),
    ),
    GetPage(
      name: Routes.CHAT_BOT,
      page: () => const ChatBotPage(),
      transition: Transition.fadeIn,
      binding: ChatBotBinding(),
    ),
  ];
}

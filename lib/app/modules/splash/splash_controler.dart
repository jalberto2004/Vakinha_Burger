import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/auth_services.dart';

class SplashControler extends GetxController {
  
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }

}
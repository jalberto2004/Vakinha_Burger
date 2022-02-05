import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/auth/login/login_controller.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}

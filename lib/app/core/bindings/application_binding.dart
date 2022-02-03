import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';

class ApplicationBindig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
  }
}

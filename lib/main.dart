import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger/app/core/bindings/application_binding.dart';
import 'package:vakinha_burger/app/core/vakinha_ui.dart';
import 'package:vakinha_burger/app/routes/auth_routers.dart';
import 'package:vakinha_burger/app/routes/home_routes.dart';
import 'package:vakinha_burger/app/routes/product_routers.dart';
import 'package:vakinha_burger/app/routes/splash_routers.dart';

Future<void> main() async {
  // Inicializa o GetStorage para verificar se o usuário está logado ou não no App
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBindig(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
      ],
    );
  }
}

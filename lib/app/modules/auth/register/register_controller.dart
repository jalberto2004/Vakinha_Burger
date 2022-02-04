import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger/app/core/constants/constants.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListner(_loading);
    messageListner(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      
      final userLogged = await _authRepository.register(name, email, password);
      
      await _authRepository.register(name, email, password);
      _loading.toggle();

      // armazena na chave USER_KEY o ID do usuário logado
      GetStorage().write(Constants.USER_KEY, userLogged.id);

    } on RestClientException catch (e,s) {
      _loading.toggle();
      log('Erro ao registrar usuário (RestClientException)', error: e, stackTrace: s);
       _message(MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error));
    } catch(e,s){
      log('Erro ao registrar usuário (RegisterController catch)', error: e, stackTrace: s);
       _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário',
          type: MessageType.error));
    }
  }
}

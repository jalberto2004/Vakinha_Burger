import 'dart:developer';
import 'package:vakinha_burger/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restclient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restclient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    var message = '';
    final result = await _restclient.post('/auth/register', {
      'name': name, 
      'email': email, 
      'password': password
    });

    if (result.hasError) {
      message = 'Erro ao registrar usuário (AuthRepositoryImpl)';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
          message,
          error: result.statusText, 
          stackTrace: StackTrace.current,
      );

      throw RestClientException(message: message);
    }

    return login(email,password);
  }

  @override
  Future<UserModel> login(String email, String password) async{
    
    final result = await _restclient.post('/auth/', 
      {
        'email':email,
        'password':password,
      }
    );

    if(result.hasError){
      if(result.statusCode == 403 ){
        log('Usuário ou senha inválidos (login)', error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }
      log('Erro ao autenticar o usuário (login) (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current
      );
      throw RestClientException(message: 'Erro ao autenticar o usuário (login)');
    }

    return UserModel.fromMap(result.body);
  }
}

import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect{
  
  final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient(){
      httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {

  final int? code;
  final String message;
  
  RestClientException({
    this.code,
    required this.message,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}

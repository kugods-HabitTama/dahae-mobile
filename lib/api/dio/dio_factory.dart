import 'package:dio/dio.dart';

class DioFactory {
  const DioFactory(this._baseUrl);

  final String _baseUrl;

  Dio create() => Dio(_createBaseOptions());

  BaseOptions _createBaseOptions() => BaseOptions(
        // Request base url
        baseUrl: _baseUrl,

        // Timeout in milliseconds for receiving data
        receiveTimeout: 15000,

        // Timeout in milliseconds for sending data
        sendTimeout: 15000,

        // Timeout in milliseconds for opening url
        connectTimeout: 5000,

        // Common query parameters for each request
        // queryParameters: <String, dynamic>{'parameter1': 'value1'},

        // Common headers for each request
        // headers: <String, dynamic>{'header1': 'value1'},
      );
}

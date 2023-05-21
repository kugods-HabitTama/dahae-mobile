import 'package:dio/dio.dart';

// https://medium.com/tide-engineering-team/basic-and-advanced-networking-in-dart-and-flutter-the-tide-way-part-0-introduction-33ac040a4a1c
// 위 링크를 참조하여 제작함.
class DioFactory {
  final String _baseUrl;

  const DioFactory(this._baseUrl);

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
      );
}

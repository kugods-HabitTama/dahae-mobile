// import 'package:dio/dio.dart';
// import 'package:intl/intl.dart';

// import 'models/account_response.dart';

// class AccountApi {
//   const AccountApi(this._dio);

//   final Dio _dio;

//   // 이메일 중복검사하는 메커니즘을 정의한다.
//   //
//   Future<AccountResponse> isEmailDuplicate(DateTime dateTime) async {
//     final response = await _dio.get<Map<String, dynamic>>(
//       '/habit/record',
//       queryParameters: {'date': DateFormat('yyyy-MM-dd').format(dateTime)},
//     );
//     final json = response.data!;
//     return AccountResponse.fromJson(json);
//   }

//   // 닉네임 중복검사하는 메커니즘을 정의한다.
//   //
//   Future<AccountResponse> isNameDuplicate(DateTime dateTime) async {
//     final response = await _dio.get<Map<String, dynamic>>(
//       '/habit/record',
//       queryParameters: {'date': DateFormat('yyyy-MM-dd').format(dateTime)},
//     );
//     final json = response.data!;
//     return AccountResponse.fromJson(json);
//   }
// }

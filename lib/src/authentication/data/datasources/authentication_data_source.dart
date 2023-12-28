import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/constants.dart';
import '../../../../services/user_signed_in_check.dart';

abstract class AuthenticationDataSource {
  const AuthenticationDataSource();

  Future<String> loginUser({
    required String mobileNumber,
    required String countryCode,
  });

  Future<String> verifyOtp({
    required String mobileNumber,
    required String otp,
  });
}

const kLoginEndpoint = '/api/d2/auth/v2/login';
const kVerifyOtpEndpoint = '/api/d2/auth/verifyotp';
const kBaseUrl = 'https://api.ourgoodspace.com';

class AuthenticationDataSourceImplementation
    implements AuthenticationDataSource {
  const AuthenticationDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<String> loginUser({
    required String mobileNumber,
    required String countryCode,
  }) async {
    try {
      final response = await _client.post(Uri.parse(kBaseUrl + kLoginEndpoint),
          body: jsonEncode({
            "number": mobileNumber,
            "countryCode": countryCode,
            "reCaptchaToken": "",
            "recaptchaAction": "LOGIN"
          }),
          headers: {
            'Content-Type': 'application/json',
            "device-id": deviceId,
            "device-type": deviceType,
          });

      if (response.statusCode != 200 && response.statusCode != 201) {
        return 'Unsuccessful';
      }

      return "Successful";
    } catch (e) {
      return 'Unsuccessful';
    }
  }

  @override
  Future<String> verifyOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    try {
      final response = await _client.post(
          Uri.parse(kBaseUrl + kVerifyOtpEndpoint),
          body: jsonEncode({
            "number": mobileNumber,
            "otp": otp,
            "inivteId": null,
            "utmTracking": null
          }),
          headers: {
            'Content-Type': 'application/json',
            "device-id": deviceId,
            "device-type": deviceType,
          });

      if (response.statusCode != 200 && response.statusCode != 201) {
        return 'Unsuccessful';
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jsonDecode(response.body)['data']['token']);
      token = jsonDecode(response.body)['data']['token'].toString();
      return "Successful";
    } catch (e) {
      return 'Unsuccessful';
    }
  }
}

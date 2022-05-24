import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:aq_prime/device/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:aq_prime/device/utils/user_data.dart' as user_data;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'user_data.dart' as user_data;

enum RequestType { post, get, put }

class API {
  Future<Map<String, dynamic>> request({
    required RequestType requestType,
    Map<String, dynamic>? parameter,
    required String endPoint,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        ((prefs.getString("token") == null) ? '' : prefs.getString("token"))!;
    debugPrint('token:${user_data.token} : Parameter: $parameter');
    Map<String, String>? headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Referer': AppConfig.referrer,
      'Authorization': 'Bearer $token',
    };
    http.Response? response;
    Uri uri;
    try {
      //============================================================
      if (requestType == RequestType.post) {
        uri = Uri.http(
            AppConfig.host, AppConfig.path + AppConfig.version + endPoint);
        print('$requestType :: Using url ==> $uri');
        response = await http
            .post(
              uri,
              headers: headers,
              body: parameter == null ? null : jsonEncode(parameter),
            )
            .timeout(const Duration(seconds: 10));
      }
      if (requestType == RequestType.get) {
        uri = Uri.http(AppConfig.host,
            AppConfig.path + AppConfig.version + endPoint, parameter);
        print('$requestType :: Using url ==> $uri');
        response = await http
            .get(
              uri,
              headers: headers,
            )
            .timeout(const Duration(seconds: 10));
      }
      if (requestType == RequestType.put) {
        uri = Uri.http(AppConfig.host,
            AppConfig.path + AppConfig.version + endPoint, parameter);
        print('$requestType :: Using url ==> $uri');
        response = await http
            .put(
              uri,
              headers: headers,
            )
            .timeout(const Duration(seconds: 10));
      }
      //============================================================
      if (response!.statusCode == 200 && response.body.isNotEmpty) {
        debugPrint(
            'RESPONSE --> (${(response.contentLength.toString())} Bytes): ${(response.body.toString())}');
        Map<String, dynamic> data = jsonDecode(response.body);

        data['needPopUpError'] = false;
        return data;
      } else {
        debugPrint(response.body);
        return jsonDecode(response.body);
      }
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Slow Internet Connection',
      };
    } on SocketException catch (e) {
      debugPrint('Socket Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'No Internet Connection',
      };
    } on FormatException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'API Error: Contact Developer',
      };
    } on HttpException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Disconnected from server',
      };
    }
  }
}

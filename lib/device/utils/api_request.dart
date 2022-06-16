import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'user_data.dart' as user_data;

enum RequestType { post, get, put, delete }

class API {
  Future<Map<String, dynamic>> request({
    RequestType requestType = RequestType.post,
    Map<String, dynamic>? parameter,
    required String endPoint,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
        ((prefs.getString("token") == null) ? '' : prefs.getString("token"))!;
    debugPrint('token:${user_data.token} : API REQUEST: $parameter');
    Map<String, String>? headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Referer': AppConfig.endPoint,
      'Authorization': 'Bearer $token',
    };
    http.Response response;
    try {
      //============================================================
      if (requestType == RequestType.post) {
        response = await http
            .post(
              Uri.http(AppConfig.host, AppConfig.path + endPoint),
              headers: headers,
              body: parameter == null ? null : jsonEncode(parameter),
            )
            .timeout(const Duration(seconds: 10));
      } else {
        response = await http
            .get(
              Uri.http(AppConfig.host, AppConfig.path + endPoint, parameter),
              headers: headers,
            )
            .timeout(const Duration(seconds: 10));
      }
      //============================================================
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        debugPrint(
            'API RESPONSE (${(response.contentLength.toString())} Bytes): ${(response.body.toString())}');
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

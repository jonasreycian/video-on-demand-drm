import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:aq_prime/device/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'user_data.dart' as user_data;

enum RequestType { post, get, put, delete, patch }

class API {
  Future<Map<String, dynamic>> request({
    required RequestType requestType,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
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
    Response? response;
    Uri uri = Uri.http(
      AppConfig.host,
      AppConfig.path + AppConfig.version + endPoint,
      parameter,
    );
    try {
      //============================================================
      if (requestType == RequestType.post) {
        response = await post(
          uri,
          headers: headers,
          body: body == null ? null : jsonEncode(body),
        ).timeout(const Duration(seconds: 10));
      }
      if (requestType == RequestType.get) {
        response = await get(uri, headers: headers).timeout(
          const Duration(seconds: 10),
        );
      }
      if (requestType == RequestType.put) {
        response = await put(
          uri,
          headers: headers,
          body: body == null ? null : jsonEncode(body),
        ).timeout(const Duration(seconds: 10));
      }
      if (requestType == RequestType.delete) {
        response = await delete(uri, headers: headers)
            .timeout(const Duration(seconds: 10));
      }
      if (requestType == RequestType.patch) {
        response = await patch(
          uri,
          headers: headers,
          body: body == null ? null : jsonEncode(body),
        ).timeout(const Duration(seconds: 10));
      }
      debugPrint('|===============================');
      if (response != null) {
        debugPrint('| METHOD ==> $requestType');
        debugPrint('| URL ==> $uri');
        debugPrint('| STATUS ==> ${response.statusCode}');
        debugPrint('| HEADERS ==> $headers');
        if (response.statusCode == 200 && response.body.isNotEmpty) {
          debugPrint('| SIZE ==> ${(response.contentLength.toString())} Bytes');
          debugPrint('| RESPONSE ==> ${(response.body.toString())}');
          return jsonDecode(response.body);
        } else {
          debugPrint('| ERROR ==> ${response.body}');
          return jsonDecode(response.body);
        }
      } else {
        debugPrint('RESPONSE OBJECT IS NULL');
      }
      debugPrint('|===============================');
      return <String, dynamic>{};
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

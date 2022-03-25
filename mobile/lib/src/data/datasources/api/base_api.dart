import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class BaseApi {
  final Client http;

  BaseApi({required this.http});

  Future<String> getMethod(String path) async {
    try {
      // final box = await Hive.openBox<String>(dotenv.env['HIVE_BOX_NAME']!);
      final uri = '${dotenv.env['BASE_URL']}$path';
      // if (shouldCache && box.get(uri) != null) {
      //   return json.decode(box.get(uri)!) as T;
      // }
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        log("Get in $path successfully");
        return response.body;
      } else {
        throw Exception("Get fail in $path");
      }
    } catch (e) {
      throw Exception("Exception get in $path");
    }
  }

  Future<String> postMethod(String path,
      {required Map<String, dynamic> body}) async {
    final header = {
      "Content-Type": 'application/json',
    };
    try {
      final uri = '${dotenv.env['BASE_URL']}$path';
      log(jsonEncode(body));
      final response = await http.post(Uri.parse(uri),
          body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        log("Post in $path successfully");
        return response.body;
      } else {
        log(response.body.toString());
        throw Exception("Post fail in $path");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // T _returnResponse<T>(Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       return jsonDecode(response.body.toString()) as T;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 401:
  //     case 403:
  //       throw UnauthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //         'Error occurred while Communication with Server with StatusCode :'
  //         ' ${response.statusCode}',
  //       );
  //   }
  // }
}

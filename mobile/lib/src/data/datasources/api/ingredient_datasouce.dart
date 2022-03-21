// import 'dart:developer';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart';
// import 'package:mobile/src/data/datasources/api/base_api.dart';

// class IngredientDatasource{
  

//   @override
//   Future<String> getMethod(String path) async {
//     final url = "${dotenv.get("BASE_URL")}$path";
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         throw Exception("Get fail  $path");
//       }
//     } catch (e) {
//       log(e.toString());
//       throw Exception("Exception get  $path");
//     }
//   }

//   @override
//   Future<String> postMethod(String path,
//       {required Map<String, dynamic> body}) async {
    // final header = {
    //   "Content-Type": 'application/json',
    // };

//     final url = "${dotenv.get("BASE_URL")}$path";
//     try {
//       final response =
//           await http.post(Uri.parse(url), headers: header, body: body);
//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         throw Exception("Post fail  $path");
//       }
//     } catch (e) {
//       log(e.toString());
//       throw Exception("Exception post $path");
//     }
//   }

//   @override
//   Future<String> deleteMethod(String path) {
//     // TODO: implement deleteMethod
//     throw UnimplementedError();
//   }

//   @override
//   Future<String> putMethod(String path) {
//     // TODO: implement putMethod
//     throw UnimplementedError();
//   }


// }

import 'dart:convert';
import 'package:flutter/services.dart';
import 'lesson_model.dart';
import 'package:http/http.dart'as http;

class ApiServer{
  // static Future<LessonModel>fetchLessons() async{  //assest method
  //   print('----------reading from assest');
  //
  //   final String response = await rootBundle.loadString('assest/sample_test.json');
  //   if(response != null){
  //     Map<String,dynamic>jsonResponse = jsonDecode(response);
  //     print('${jsonResponse}');
  //     return LessonModel.fromJson(jsonResponse);
  //   }else{
  //     throw Exception('Failed to load lessons');
  //   }
  // }


  static Future<LessonModel> fetchLessons() async{
    print('--------reading from assets');
    final response = await http.get(
      Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons')
    );
    if(response.statusCode == 200){
      Map<String,dynamic>jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return LessonModel.fromJson(jsonResponse);
    }else{
      throw Exception('failed to load lessons');
    }
  }
}
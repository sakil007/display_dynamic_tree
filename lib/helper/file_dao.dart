import 'dart:convert';
import 'package:flutter/services.dart';

class FileDao {
  static  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
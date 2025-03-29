import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class GeminiApi {
  Future<String> geminiResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyCUc50ANqvVx0m-cd2Lew40CdS3jC5SD_8"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {"parts": [{"text": prompt}]}
          ]
        }),
      );
      late String result;
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        result = data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        // throw Exception("Failed to get response: ${response.body}");
        result = data["error"]["message"];
      }
      return result;
    } on Exception catch (e) {
      return "Network Issue";
    }
  } 
}
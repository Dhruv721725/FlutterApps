import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  Future<String> getGeminiResponse(String prompt) async {
    final response = await http.post(
      Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyCUc50ANqvVx0m-cd2Lew40CdS3jC5SD_8"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {"parts": [{"text": prompt}]}
        ]
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      throw Exception("Failed to get response: ${response.body}");
    }
  }
}

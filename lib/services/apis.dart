import 'dart:convert';
import 'package:firstkick/model/memes_response.dart';
import 'package:http/http.dart' as http;
 // update this path if needed

class API {
  static Future<MemeResponse?> getMemes() async {
    try {
      final response = await http.get(Uri.parse("https://api.imgflip.com/get_memes"));
      if (response.statusCode == 200) {
        print("✅ Fetched meme data");
        return MemeResponse.fromJson(json.decode(response.body));
      } else {
        print("❌ API error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return null;
    }
  }
}

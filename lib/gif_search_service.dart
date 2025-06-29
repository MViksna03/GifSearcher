import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

class GifSearchService {
  final String apiKey = Config.apiKey;

  Future<List<String>> searchGifs(String query,
      {int offset = 0, int limit = 10}) async {
    final url =
        'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&offset=$offset&limit=$limit';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data'] as List<dynamic>;
      final gifUrls = results
          .map((result) => result['images']['fixed_height']['url'] as String)
          .toList();
      return gifUrls;
    } else {
      throw Exception('Failed to load gifs');
    }
  }
}

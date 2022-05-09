import 'package:http/http.dart' as http;

class DataService {
  final String _baseUrl = "api.coingecko.com";

  Future<String> get(String segment, Map<String, dynamic>? queryParams) async {
    try {
      final url = Uri.https(_baseUrl, "/api/v3/", queryParams);
      final response = await http.get(url);
      return response.body;
    } catch (e) {
      return '';
    }
  }
}

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = 'https://api.etrackings.com/v2/tracks';

  Future<http.Response> getPost() async {
    return await http.get('$apiUrl/post');
  }

  Future<http.Response> getPostView(int id) async {
    return await http.get('$apiUrl/post/$id');
  }
}
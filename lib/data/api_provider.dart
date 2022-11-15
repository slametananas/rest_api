import 'dart:convert';
import 'dart:html';
import 'package:http/http/dart' show Client, Respone;
import 'package:minggu_10_moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '';
  String baseUrl = '';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    // String url = '';
    // print(url);
    Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}

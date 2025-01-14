import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_db/models/movie_model.dart';

class MovieApiService {
  final String apiKey = '77d777b2302ed9aa346e95c4f34dbdd3';
  final String baseUrl = 'https://api.themoviedb.org/3/';

  Future<MovieResponse> getPopularMovies() async {
    final response = await http.get(Uri.parse('${baseUrl}movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

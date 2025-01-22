import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_db/models/model.dart';
import 'package:movie_db/models/now_playing.dart';
import 'package:movie_db/models/people.dart';
import 'package:movie_db/models/popular_movie.dart';
import '../models/api_return_value.dart';


String baseUrl = "https://api.themoviedb.org/3";
String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3N2Q3NzdiMjMwMmVkOWFhMzQ2ZTk1YzRmMzRkYmRkMyIsIm5iZiI6MTczNjc0MTczOS43MDcsInN1YiI6IjY3ODQ5MzZiNjAxYWNmZTdiZDRmMzhjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZCvFhnV0X_1zxB_3Xfolu-UJ_2fCTKuu6d8CMwul70Q";

class MovieService {
  static Future<ApiReturnValue<List<PopularMovie>>> getPopularMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/popular?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Popular Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<PopularMovie> popularMovie = (data["results"] as Iterable)
          .map((e) => PopularMovie.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: popularMovie,
      );
    }
  }

  static Future<ApiReturnValue<List<NowPlaying>>> getNowPlayingMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/now_playing?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Now Playing Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<NowPlaying> nowPlaying = (data["results"] as Iterable)
          .map((e) => NowPlaying.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: nowPlaying,
      );
    }
  }

  static Future<ApiReturnValue<List<People>>> getPeople(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/539972/credits?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Popular Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<People> people = (data["results"] as Iterable)
          .map((e) => People.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: people,
      );
    }
  }

  static Future<ApiReturnValue<List<Genre>>> getGenre(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/genre/movie/list?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Genre Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<Genre> genre = (data["results"] as Iterable)
          .map((e) => Genre.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: genre,
      );
    }
  }
}


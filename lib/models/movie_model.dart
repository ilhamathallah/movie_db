class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({required this.id, required this.title, required this.overview, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}

class MovieResponse {
  final List<Movie> results;

  MovieResponse({required this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> movies = list.map((i) => Movie.fromJson(i)).toList();

    return MovieResponse(results: movies);
  }
}

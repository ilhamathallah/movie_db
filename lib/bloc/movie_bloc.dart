import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/services/service.dart';
import 'package:movie_db/models/movie_model.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApiService movieApiService;

  MovieBloc(this.movieApiService) : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovies) {
      yield MovieLoading();
      try {
        final MovieResponse movieResponse = await movieApiService.getPopularMovies();
        yield MovieLoaded(movieResponse.results);
      } catch (e) {
        yield MovieError(e.toString());
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/api_return_value.dart';
import '../models/popular_movie.dart';
import 'package:movie_db/services/movie_service.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  Future<void> getPopularMovie() async {
    ApiReturnValue<List<PopularMovie>> result =
    await MovieService.getPopularMovie(page: 1);

    print(result);
    if (result.value != null) {
      emit(PopularMovieLoaded(result.value!));
    } else {
      emit(PopularMovieLoadingFailed(result.message!));
    }
  }
}

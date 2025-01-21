import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/models/api_return_value.dart';
import 'package:movie_db/models/now_playing.dart';
import 'package:movie_db/services/movie_service.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  Future<void> getNowPlayingMovie() async {
    ApiReturnValue<List<NowPlaying>> result =
        await MovieService.getNowPlayingMovie(page: 1);

    print(result);
    if(result.value != null) {
      emit(NowPlayingMovieLoaded(result.value!));
    } else {
      emit(NowPlayingMovieLoadingFailed(result.message!));
    }
  }
}
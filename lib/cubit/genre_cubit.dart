import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/models/api_return_value.dart';
import 'package:movie_db/models/genre.dart';
import 'package:movie_db/services/movie_service.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit() : super(GenreInitial());

  Future<void> getGenre() async {
    ApiReturnValue<List<Genre>> result =
    await MovieService.getGenre();

    print(result);
    if(result.value != null){
      emit(GenreLoaded(result.value!));
    } else {
      emit(GenreLoadingFailed(result.message!));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_db/models/api_return_value.dart';
import 'package:movie_db/models/people.dart';
import 'package:movie_db/services/movie_service.dart';

part 'people_state.dart';

class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit() : super(PeopleInitial());

  Future<void> getPeople() async {
    ApiReturnValue<List<People>> result =
    await MovieService.getPeople(page: 1);

    print(result);
    if(result.value != null){
      emit(PeopleLoaded(result.value!.cast<PeopleState>()));
    } else {
      emit(PeopleLoadingFailed(result.message!));
    }
  }
}

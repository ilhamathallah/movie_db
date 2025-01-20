part of 'people_cubit.dart';

sealed class PeopleState extends Equatable{
  const PeopleState();
}

final class PeopleInitial extends PeopleState {
  @override
  List<Object?> get props => [];
}

final class PeopleLoaded extends PeopleState {
  final List<PeopleState> people;

  const PeopleLoaded(this.people);

  @override
  List<Object?> get props => [people];
}

final class PeopleLoadingFailed extends PeopleState {
  final String message;

  const PeopleLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}

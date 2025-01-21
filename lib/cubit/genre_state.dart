part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  const GenreState();
}

final class GenreInitial extends GenreState {
  @override
  List<Object?> get props => [];
}

final class GenreLoaded extends GenreState {
  final List<Genre> genre;

  const GenreLoaded(this.genre);

  @override
  // TODO: implement props
  List<Object?> get props => [genre];
}

final class GenreLoadingFailed extends GenreState{
  final String message;

  const GenreLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

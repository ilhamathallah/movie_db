part of 'now_playing_cubit.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();
}

final class NowPlayingInitial extends NowPlayingState {
  @override
  List<Object> get props => [];
}

final class NowPlayingMovieLoaded extends NowPlayingState {
  final List<NowPlaying> nowPlaying;
  const NowPlayingMovieLoaded(this.nowPlaying);

  @override
  List<Object?> get props => [nowPlaying];
}

final class NowPlayingMovieLoadingFailed extends NowPlayingState {
  final String message;
  const NowPlayingMovieLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/bloc/movie_bloc.dart';
import 'package:movie_db/bloc/movie_event.dart';
import 'package:movie_db/bloc/movie_state.dart';
import 'package:movie_db/models//movie_model.dart';

import '../services/service.dart';

class MovieListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Movies')),
      body: BlocProvider(
        create: (context) => MovieBloc(MovieApiService()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return ListTile(
                    leading: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                    title: Text(movie.title),
                    subtitle: Text(movie.overview),
                  );
                },
              );
            } else if (state is MovieError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/cubit/genre_cubit.dart';
import 'package:movie_db/cubit/now_playing_cubit.dart';
import 'package:movie_db/cubit/popular_cubit.dart';
import 'package:movie_db/ui/detail_card.dart';
import 'ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PopularCubit()),
          BlocProvider(create: (_) => NowPlayingCubit()),
          BlocProvider(create: (_) => GenreCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MovieDb',
          home: HomePage(),
        ),
    );
  }
}

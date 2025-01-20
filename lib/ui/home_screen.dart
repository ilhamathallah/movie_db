import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/cubit/popular_cubit.dart';
import 'package:movie_db/models/popular_movie.dart';
import 'package:movie_db/ui/detail_card.dart';
import 'package:movie_db/ui/widgets/popular_card.dart';

import '../cubit/now_playing_cubit.dart';
import '../models/now_playing.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PopularCubit>().getPopularMovie();
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80,
        title: const Text(
          'Moviedb',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu_rounded, size: 32, color: Colors.grey,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 32,color:Colors.grey,),
          ),
          const SizedBox(width: 16),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // popular
            SizedBox(
              height: 250,
              child: BlocBuilder<PopularCubit, PopularState>(builder: (_, state) {
                if (state is PopularMovieLoaded) {
                  List<PopularMovie> movie = state.popularMovie;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.length,
                    itemBuilder: (context, index) {
                      var e = movie[index];
                      return CardMovie(
                        name: e.title!,
                        image: e.image!,
                        rating: e.rating!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                title: e.title!,
                                posterPath: e.image!,
                                overview: e.overview!,
                                releaseDate: e.release!,
                                genres: e.genre!,
                                rating: e.rating!.toDouble(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
            const SizedBox(height: 35),
            const Text(
              'Now Playing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // now playing
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: BlocBuilder<NowPlayingCubit, NowPlayingState>(builder: (_, state) {
                      if (state is NowPlayingMovieLoaded) {
                        List<NowPlaying> movie = state.nowPlaying;

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                            movie
                                .take(7)
                                .map((e) => CardMovie(name: e.title!, image: e.image!))
                                .toList() +
                                [],
                          ),
                        );
                      } else {
                        return Container(
                          child: Text("NTTTT"),
                        );
                      }
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

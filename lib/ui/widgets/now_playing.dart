import 'package:flutter/material.dart';
import 'package:movie_db/models/now_playing.dart';
import 'package:movie_db/ui/detail_card.dart';

class NowPlayingWidget extends StatelessWidget {
  final NowPlaying nowPlaying; // Menggunakan NowPlaying daripada List<NowPlaying>

  const NowPlayingWidget({Key? key, required this.nowPlaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nowPlaying.results.length, // Menggunakan results dari NowPlaying
        itemBuilder: (context, index) {
          final movie = nowPlaying.results[index]; // Akses movie dalam results
          return GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}', // Ambil poster
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk mendapatkan genre berdasarkan ID (dapat diubah sesuai dengan data genre yang Anda miliki)
  String _getGenreFromId(int id) {
    // Contoh ID genre (dapat disesuaikan dengan data genre dari API)
    Map<int, String> genreMap = {
      28: 'Action',
      12: 'Adventure',
      16: 'Animation',
      35: 'Comedy',
      80: 'Crime',
      // Tambahkan ID genre lainnya sesuai data API
    };
    return genreMap[id] ?? 'Unknown'; // Default 'Unknown' jika ID tidak ditemukan
  }
}

import 'package:flutter/material.dart';
import 'package:movie_db/models/model.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String posterPath;
  final String releaseDate;
  final String overview;
  final double rating;
  final List<String> genres;

  const DetailPage(
      {super.key,
        required this.title,
        required this.posterPath,
        required this.releaseDate,
        required this.overview,
        required this.genres,
        required this.rating});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original/${widget.posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A4E8C),
                        ),
                      ),
                      Text(
                        "${widget.rating.toStringAsFixed(1)}",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF3A4E8C)),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Release Date: ${widget.releaseDate}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    children: [
                      Text('Genres: ${widget.genres.where((g) => widget.genres.contains(g)).toList()}'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_movie/model/detail_movie_model.dart';
import 'package:my_movie/service/movie_service.dart';

class PageDetailMovie extends StatefulWidget {
  final String idMovie;

  const PageDetailMovie({
    Key? key,
    required this.idMovie,
  }) : super(key: key);

  @override
  State<PageDetailMovie> createState() => _PageDetailMovieState();
}

class _PageDetailMovieState extends State<PageDetailMovie> {
  DetailMovieModel detailMovieModel = DetailMovieModel();
  bool isLoading = false;

  @override
  void initState() {
    MovieService()
        .getDetailMovie(
            idMovie: widget.idMovie,
            onLoading: (value) {
              setState(() {
                isLoading = value;
              });
              print("cek data isLoading $isLoading");
            })
        .then((value) {
      detailMovieModel = value;
      print("cek data  ${detailMovieModel.releaseDate}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        top: true,
        child: isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w500/${detailMovieModel.posterPath}",
                    height: 287,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          detailMovieModel.overview ?? "",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          "Status : ${detailMovieModel.status}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Release Date: ${detailMovieModel.releaseDate}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

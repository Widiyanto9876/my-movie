import 'package:flutter/material.dart';
import 'package:my_movie/model/movie_list_model.dart';
import 'package:my_movie/service/movie_service.dart';
import 'package:my_movie/view/widget/card_movie.dart';

class PageMovieList extends StatefulWidget {
  const PageMovieList({super.key});

  @override
  State<PageMovieList> createState() => _PageMovieListState();
}

class _PageMovieListState extends State<PageMovieList> {
  MovieListModel movieListModel = MovieListModel();
  bool isLoading = false;

  @override
  void initState() {
    MovieService().getMovieList(onLoading: (value) {
      setState(() {
        isLoading = value;
      });
    }).then((value) {
      movieListModel = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 23,
                top: 15,
              ),
              child: Text(
                "Movie List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
            ),
            isLoading
                ? Expanded(
                    child: ListView.builder(
                      itemCount: movieListModel.results?.length,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      itemBuilder: (context, index) {
                        return CardMovie(
                          itemMovie: movieListModel.results![index],
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

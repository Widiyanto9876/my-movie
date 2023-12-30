import 'package:flutter/material.dart';
import 'package:my_movie/view/widget/card_movie.dart';

class PageMovieList extends StatefulWidget {
  const PageMovieList({super.key});

  @override
  State<PageMovieList> createState() => _PageMovieListState();
}

class _PageMovieListState extends State<PageMovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 23, top: 33),
            child: Text(
              "Movie List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 25, top: 57,),
              itemBuilder: (context, index) {
                return const CardMovie();
              },
            ),
          )
        ],
      ),
    );
  }
}

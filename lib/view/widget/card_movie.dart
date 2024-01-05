import 'package:flutter/material.dart';
import 'package:my_movie/model/movie_list_model.dart';
import 'package:my_movie/view/page_detail_movie.dart';

class CardMovie extends StatelessWidget {
  final Results itemMovie;

  const CardMovie({
    super.key,
    required this.itemMovie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PageDetailMovie(idMovie: itemMovie.id.toString()),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${itemMovie.posterPath}",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      itemMovie.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      itemMovie.releaseDate ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      itemMovie.overview ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

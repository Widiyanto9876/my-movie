import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_movie/model/detail_movie_model.dart';
import 'package:my_movie/model/movie_list_model.dart';

class MovieService {
  Future<MovieListModel> getMovieList({
    required Function(bool) onLoading,
  }) async {
    onLoading(false);
    var response = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=59f28710602609d395fc206f6220183a",
      ),
    );
    if (response.statusCode == 200) {
      onLoading(true);
      return MovieListModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("$runtimeType - $response");
    }
  }

  Future<DetailMovieModel> getDetailMovie({
    required Function(bool) onLoading,
    required String idMovie,
  }) async {
    onLoading(false);
    var response = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/movie/$idMovie?api_key=59f28710602609d395fc206f6220183a",
      ),
    );
    if (response.statusCode == 200) {
      onLoading(true);
      return DetailMovieModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception("$runtimeType $response");
    }
  }
}

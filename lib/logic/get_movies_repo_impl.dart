import 'package:dio/dio.dart';

import 'package:tommy_kotonchik/logic/get_movies_repo.dart';
import 'package:tommy_kotonchik/logic/movie_model.dart';
import 'package:tommy_kotonchik/logic/server/catch_exception.dart';

class GetMoviesRepoImpl implements GetMoviesRepo {
  GetMoviesRepoImpl({
    required this.dio,
  });
  final Dio dio;
  @override
  Future<MovieModel> getMovies(int currantPage, String seacrhText) async {
    try {
      final response = await dio.get(
        'v1.2/movie/search',
        queryParameters: {
          'page': currantPage,
          'query': seacrhText,
        },
      );

      return MovieModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}

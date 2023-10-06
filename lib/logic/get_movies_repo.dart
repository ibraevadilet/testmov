import 'package:tommy_kotonchik/logic/movie_model.dart';

abstract class GetMoviesRepo {
  Future<MovieModel> getMovies(int currantPage, String seacrhText);
}

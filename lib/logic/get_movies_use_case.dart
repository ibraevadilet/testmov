import 'package:tommy_kotonchik/logic/get_movies_repo.dart';
import 'package:tommy_kotonchik/logic/movie_model.dart';

class GetMoviesUseCase {
  GetMoviesUseCase({
    required this.repo,
  });
  final GetMoviesRepo repo;

  List<MovieDetailModel> movies = [];

  Future<MovieModel> getMovies(int currantPage, String seacrhText) async {
    try {
      final result = await repo.getMovies(currantPage, seacrhText);
      movies.addAll(result.movies);
      return result.copyWith(movies: List.from(movies));
    } catch (e) {
      rethrow;
    }
  }
}

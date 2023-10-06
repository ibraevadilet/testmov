part of 'get_movies_cubit.dart';

@freezed
class GetMoviesState with _$GetMoviesState {
  const factory GetMoviesState.loading() = _Loading;
  const factory GetMoviesState.error(String error) = _Error;
  const factory GetMoviesState.success(MovieModel model) = _Success;
}

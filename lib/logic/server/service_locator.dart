import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tommy_kotonchik/logic/get_movies_cubit/get_movies_cubit.dart';
import 'package:tommy_kotonchik/logic/get_movies_repo.dart';
import 'package:tommy_kotonchik/logic/get_movies_repo_impl.dart';
import 'package:tommy_kotonchik/logic/get_movies_use_case.dart';
import 'package:tommy_kotonchik/logic/server/dio_settings.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Other Services
  sl.registerLazySingleton<Dio>(() => DioSettings().dio);

  /// Repository
  sl.registerFactory<GetMoviesRepo>(() => GetMoviesRepoImpl(dio: sl()));

  /// UseCases
  sl.registerFactory<GetMoviesUseCase>(() => GetMoviesUseCase(repo: sl()));

  /// BLoCs / Cubits
  sl.registerFactory<GetMoviesCubit>(() => GetMoviesCubit(useCase: sl()));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tommy_kotonchik/logic/get_movies_use_case.dart';
import 'package:tommy_kotonchik/logic/movie_model.dart';

part 'get_movies_state.dart';
part 'get_movies_cubit.freezed.dart';

class GetMoviesCubit extends Cubit<GetMoviesState> {
  GetMoviesCubit({required this.useCase})
      : super(const GetMoviesState.loading()) {
    getMovies();
  }

  final GetMoviesUseCase useCase;

  int currantPage = 1;
  String seacrhText = '';

  int allPages = 0;

  late ScrollController scrollController =
      ScrollController(initialScrollOffset: 0)..addListener(_scrollListener);

  Future<void> getMovies() async {
    try {
      final result = await useCase.getMovies(currantPage, seacrhText);
      allPages = result.pages;
      emit(GetMoviesState.success(result));
    } catch (e) {
      emit(GetMoviesState.error(e.toString()));
    }
  }

  void searchByName({String? name}) {
    if (name != null) {
      seacrhText = name;
    }
    useCase.movies.clear();
    currantPage = 1;
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }

    getMovies();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (allPages != currantPage) {
        currantPage = currantPage += 1;
        getMovies();
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tommy_kotonchik/logic/get_movies_cubit/get_movies_cubit.dart';
import 'package:tommy_kotonchik/logic/movie_model.dart';
import 'package:tommy_kotonchik/logic/server/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetMoviesCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Фильмы'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Builder(
                  builder: (context) => TextFormField(
                    onChanged: (name) {
                      context.read<GetMoviesCubit>().searchByName(name: name);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Поиск по  названию',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: BlocBuilder<GetMoviesCubit, GetMoviesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        error: (error) => Text(error),
                        success: (model) => ListView.separated(
                          controller:
                              context.read<GetMoviesCubit>().scrollController,
                          itemBuilder: (context, index) => ItemWidget(
                            model: model.movies[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: model.movies.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.model,
  });

  final MovieDetailModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(model.name),
          const SizedBox(height: 12),
          Text(model.description),
          const Divider(),
        ],
      ),
    );
  }
}

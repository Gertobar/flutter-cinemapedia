import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/features/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchdMoviesNotifier, List<Movie>>((ref) {
      final movieRepository = ref.read(movieRepositoryProvider);

      return SearchdMoviesNotifier(
        searchMovies: movieRepository.searchMovies,
        ref: ref,
      );
    });

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchdMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMovieCallback searchMovies;
  final Ref ref;

  SearchdMoviesNotifier({required this.searchMovies, required this.ref})
    : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}

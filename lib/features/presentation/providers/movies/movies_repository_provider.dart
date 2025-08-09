import 'package:cinemapedia/data/datasources/moviedb_datasources.dart';
import 'package:cinemapedia/data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//repository imutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasources());
},);
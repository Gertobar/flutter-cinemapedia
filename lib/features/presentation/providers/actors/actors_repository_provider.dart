import 'package:cinemapedia/data/datasources/actor_moviedb_datasources.dart';
import 'package:cinemapedia/data/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasources());
},);
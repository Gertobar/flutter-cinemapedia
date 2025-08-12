import 'package:cinemapedia/data/datasources/moviedb_datasources.dart';
import 'package:cinemapedia/data/mappers/actor_mapper.dart';
import 'package:cinemapedia/data/models/moviedb/cast_response.dart';
import 'package:cinemapedia/domain/datasources/actors_datasousce.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMoviedbDatasources extends ActorsDatasousce {
  final dio = MoviedbDatasources().dio;

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CastResponse.fromJson(response.data);
    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}

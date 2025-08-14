
import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsDatasousce {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
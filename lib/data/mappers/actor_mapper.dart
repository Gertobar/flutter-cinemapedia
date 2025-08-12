import 'package:cinemapedia/data/models/moviedb/cast_response.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) =>
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://i1.wp.com/images.binaryfortress.com/General/UnknownUser1024.png?ssl=1',
     character: cast.character
     );
}
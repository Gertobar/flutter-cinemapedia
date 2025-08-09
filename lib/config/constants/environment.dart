import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDvKEy = dotenv.env['THE_MOVIEDB_KEY'] ?? 'there is no API key';
}
class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';

static const String accessToken = String.fromEnvironment(
  'TMDB_ACCESS_TOKEN',
  defaultValue: '',
);

  static const String posterSizeSmall = 'w200';
  static const String posterSizeMedium = 'w500';
  static const String backdropSize = 'w780';
}

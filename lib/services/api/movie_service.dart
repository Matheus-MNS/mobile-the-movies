import 'package:dio/dio.dart';

import '../../models/movie_response.dart';
import '../../models/movie.dart';

class MovieService {
  const MovieService(this._dio);

  final Dio _dio;

  Future<MovieResponse> getPopularMovies({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/popular',
      queryParameters: {
        'page': page
      },
    );

    return MovieResponse.fromJson(response.data!);
  }

  Future<MovieResponse> getTopRatedMovies({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/top_rated',
      queryParameters: {'page': page, },
    );

    return MovieResponse.fromJson(response.data!);
  }

  Future<MovieResponse> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page
      },
    );

    return MovieResponse.fromJson(response.data!);
  }

  Future<Movie> getMovieDetails(int movieId) async {
  final response = await _dio.get<Map<String, dynamic>>(
    '/movie/$movieId',
  );

  return Movie.fromJson(response.data!);
}
}
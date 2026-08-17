import 'package:dio/dio.dart';

import '../core/errors/failure.dart';
import '../core/utils/result.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import '../services/api/movie_service.dart';

class MovieRepository {
  const MovieRepository(this._service);

  final MovieService _service;

  Future<Result<MovieResponse>> getPopularMovies({int page = 1}) async {
    return _guard(() => _service.getPopularMovies(page: page));
  }

  Future<Result<MovieResponse>> getTopRatedMovies({int page = 1}) async {
    return _guard(() => _service.getTopRatedMovies(page: page));
  }

  Future<Result<MovieResponse>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    return _guard(() => _service.searchMovies(query: query, page: page));
  }

  Future<Result<Movie>> getMovieDetails(int movieId) async {
    return _guard(() => _service.getMovieDetails(movieId));
  }

  Future<Result<T>> _guard<T>(Future<T> Function() request) async {
    try {
      final data = await request();
      return Success(data);
    } on DioException catch (e) {
      return Error(_mapDioException(e));
    } catch (e) {
      return Error(Failure.unknown(message: e.toString()));
    }
  }

  Failure _mapDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return const Failure.noConnection();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.timeout();

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode ?? 0;
        return switch (statusCode) {
          401 || 403 => const Failure.unauthorized(),
          404 => const Failure.notFound(),
          _ => Failure.server(statusCode: statusCode),
        };

      default:
        return Failure.unknown(message: exception.message);
    }
  }
}
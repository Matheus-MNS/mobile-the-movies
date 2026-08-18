import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/movie_repository.dart';
import '../../services/api/dio_client.dart';
import '../../services/api/movie_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.create();
});

final movieServiceProvider = Provider<MovieService>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieService(dio);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final service = ref.watch(movieServiceProvider);
  return MovieRepository(service);
});
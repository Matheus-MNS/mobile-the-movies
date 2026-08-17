import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.noConnection() = NoConnectionFailure;

  const factory Failure.timeout() = TimeoutFailure;

  const factory Failure.notFound() = NotFoundFailure;

  const factory Failure.unauthorized() = UnauthorizedFailure;

  const factory Failure.server({required int statusCode}) = ServerFailure;

  const factory Failure.unknown({String? message}) = UnknownFailure;
}
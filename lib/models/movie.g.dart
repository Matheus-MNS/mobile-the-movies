// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  overview: json['overview'] as String? ?? '',
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  releaseDate: json['release_date'] as String?,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
  originalLanguage: json['original_language'] as String? ?? '',
);

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'original_language': instance.originalLanguage,
    };

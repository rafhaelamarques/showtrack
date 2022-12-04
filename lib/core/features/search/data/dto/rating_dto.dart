import 'package:showtrack/core/features/search/domain/entities/rating_entity.dart';

class RatingDto extends RatingEntity {
  RatingDto({
    required String average,
  }) : super(
          average: average,
        );

  factory RatingDto.fromJson(Map<String, dynamic> json) {
    return RatingDto(
      average: json['average'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average': average,
    };
  }

  RatingDto.empty({
    String average = '',
  }) : super(
          average: average,
        );
}

import 'package:showtrack/core/features/search/domain/entities/image_entity.dart';

class ImageDto extends ImageEntity {
  ImageDto({
    required String medium,
    required String original,
  }) : super(
          medium: medium,
          original: original,
        );

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      medium: json['medium'] ?? "",
      original: json['original'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medium': medium,
      'original': original,
    };
  }

  ImageDto.empty({
    String medium = '',
    String original = '',
  }) : super(
          medium: medium,
          original: original,
        );
}

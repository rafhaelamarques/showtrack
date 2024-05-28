import 'package:json_annotation/json_annotation.dart';

part 'image_banner.g.dart';

@JsonSerializable()
class ImageBanner {
  String? medium;
  String? original;

  ImageBanner({
    this.medium,
    this.original,
  });

  factory ImageBanner.fromJson(Map<String, dynamic> json) =>
      _$ImageBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ImageBannerToJson(this);
}

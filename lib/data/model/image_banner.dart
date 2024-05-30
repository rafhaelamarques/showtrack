import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_banner.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class ImageBanner {
  @HiveField(0)
  String? medium;
  @HiveField(1)
  String? original;

  ImageBanner({
    this.medium,
    this.original,
  });

  factory ImageBanner.fromJson(Map<String, dynamic> json) =>
      _$ImageBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ImageBannerToJson(this);
}

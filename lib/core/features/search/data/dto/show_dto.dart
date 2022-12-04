import 'package:showtrack/core/features/search/data/dto/image_dto.dart';
import 'package:showtrack/core/features/search/data/dto/rating_dto.dart';
import 'package:showtrack/core/features/search/data/dto/web_channel_dto.dart';
import 'package:showtrack/core/features/search/domain/entities/show_entity.dart';

class ShowDto extends ShowEntity {
  RatingDto? ratingDto;
  WebChannelDto? webChannelDto;
  ImageDto? imageDto;
  ShowDto({
    required int id,
    required String name,
    required String summary,
    this.ratingDto,
    this.webChannelDto,
    this.imageDto,
  }) : super(
          id: id,
          name: name,
          summary: summary,
          rating: ratingDto,
          webChannel: webChannelDto,
          image: imageDto,
        );

  factory ShowDto.fromJson(Map<String, dynamic> json) {
    return ShowDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      summary: json['summary'] ?? "",
      ratingDto: json['rating'] != null
          ? RatingDto.fromJson(json['rating'])
          : RatingDto.empty(),
      webChannelDto: json['webChannel'] != null
          ? WebChannelDto.fromJson(json['webChannel'])
          : WebChannelDto.empty(),
      imageDto: json['image'] != null
          ? ImageDto.fromJson(json['image'])
          : ImageDto.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'summary': summary,
      'rating': ratingDto!.toJson(),
      'webChannel': webChannelDto!.toJson(),
      'image': imageDto!.toJson(),
    };
  }

  ShowDto.empty({
    int id = 0,
    String name = '',
    String summary = '',
    this.ratingDto,
    this.webChannelDto,
    this.imageDto,
  }) : super(
          id: id,
          name: name,
          summary: summary,
          rating: ratingDto,
          webChannel: webChannelDto,
          image: imageDto,
        );
}

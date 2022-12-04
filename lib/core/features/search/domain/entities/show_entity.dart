import 'package:showtrack/core/features/search/domain/entities/image_entity.dart';
import 'package:showtrack/core/features/search/domain/entities/rating_entity.dart';
import 'package:showtrack/core/features/search/domain/entities/web_channel_entity.dart';

class ShowEntity {
  int id;
  String name;
  String summary;
  RatingEntity? rating;
  WebChannelEntity? webChannel;
  ImageEntity? image;

  ShowEntity({
    required this.id,
    required this.name,
    required this.summary,
    this.rating,
    this.webChannel,
    this.image,
  });

  ShowEntity.empty({
    this.id = 0,
    this.name = '',
    this.summary = '',
    this.rating,
    this.webChannel,
    this.image,
  });
}

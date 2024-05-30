import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Links {
  @HiveField(0)
  LinkEpisode? previousepisode;
  @HiveField(1)
  LinkEpisode? nextepisode;

  Links({
    this.previousepisode,
    this.nextepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 6)
class LinkEpisode {
  @HiveField(0)
  String? href;
  @HiveField(1)
  String? name;

  LinkEpisode({
    required this.name,
    this.href,
  });

  factory LinkEpisode.fromJson(Map<String, dynamic> json) =>
      _$LinkEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$LinkEpisodeToJson(this);
}

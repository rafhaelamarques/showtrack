import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  LinkEpisode? previousepisode;
  LinkEpisode? nextepisode;

  Links({
    this.previousepisode,
    this.nextepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class LinkEpisode {
  String? href;
  String? name;

  LinkEpisode({
    required this.name,
    this.href,
  });

  factory LinkEpisode.fromJson(Map<String, dynamic> json) =>
      _$LinkEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$LinkEpisodeToJson(this);
}

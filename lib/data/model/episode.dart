import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  int id;
  String name;
  int? season;
  int? number;
  String? airdate;
  String? airtime;

  Episode({
    required this.id,
    required this.name,
    this.season,
    this.number,
    this.airdate,
    this.airtime,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

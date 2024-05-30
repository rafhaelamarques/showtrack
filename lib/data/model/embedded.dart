import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/episode.dart';

part 'embedded.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class Embedded {
  @HiveField(0)
  Episode? nextepisode;

  Embedded({
    this.nextepisode,
  });

  factory Embedded.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedToJson(this);
}

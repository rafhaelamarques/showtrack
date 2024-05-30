import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/country.dart';

part 'channel.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Channel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  Country? country;
  @HiveField(3)
  String? officialSite;

  Channel({
    required this.id,
    required this.name,
    this.country,
    this.officialSite,
  });

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

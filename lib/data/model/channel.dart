import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/country.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  int id;
  String name;
  Country? country;
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

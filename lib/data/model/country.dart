import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class Country {
  @HiveField(0)
  String name;
  @HiveField(1)
  String code;
  @HiveField(2)
  String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

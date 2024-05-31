import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class Episode {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int? season;
  @HiveField(3)
  int? number;
  @HiveField(4)
  String? airdate;
  @HiveField(5)
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

  @override
  String toString() {
    return season != null && number != null
        ? 'Episode $number x Season $season \n $name'
        : name;
  }

  String get dateFormatted {
    if (airdate == "") return '';
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(airdate!));
  }

  String get dateTime {
    if (airdate == "" && airtime == "") return '';
    return airtime != "" ? '$dateFormatted às $airtime' : dateFormatted;
  }
}

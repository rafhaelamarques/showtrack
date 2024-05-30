import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Rating {
  @HiveField(0)
  double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

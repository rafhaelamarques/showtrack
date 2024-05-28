import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/show.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  double score;
  Show show;

  Search({
    required this.score,
    required this.show,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Schedule {
  @HiveField(0)
  String? time;
  @HiveField(1)
  List<String>? days;

  Schedule({
    this.time,
    this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  @override
  String toString() {
    return time != '' && days != null
        ? '$time | ${days?.join(', ')}'
        : 'Sem informações';
  }
}

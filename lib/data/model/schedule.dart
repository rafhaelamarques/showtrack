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

  // exemplo: 21:00 | Segunda-feira, Terça-feira
  @override
  String toString() {
    return time != '' && days != null
        ? '$time | $formattedDays'
        : 'Sem informações';
  }

  // Transforma os dias da semana vindos da API para o português
  String get formattedDays {
    if (days == null) return '';
    return days!.map((day) => fromEnglish(day)).join(', ');
  }

  String fromEnglish(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return DayOfWeek.monday.value;
      case 'tuesday':
        return DayOfWeek.tuesday.value;
      case 'wednesday':
        return DayOfWeek.wednesday.value;
      case 'thursday':
        return DayOfWeek.thursday.value;
      case 'friday':
        return DayOfWeek.friday.value;
      case 'saturday':
        return DayOfWeek.saturday.value;
      case 'sunday':
        return DayOfWeek.sunday.value;
      default:
        return '';
    }
  }
}

enum DayOfWeek {
  monday('Segunda-feira'),
  tuesday('Terça-feira'),
  wednesday('Quarta-feira'),
  thursday('Quinta-feira'),
  friday('Sexta-feira'),
  saturday('Sábado'),
  sunday('Domingo');

  final String value;

  const DayOfWeek(this.value);
}

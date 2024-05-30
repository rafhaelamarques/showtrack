import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/channel.dart';
import 'package:showtrack/data/model/embedded.dart';
import 'package:showtrack/data/model/image_banner.dart';
import 'package:showtrack/data/model/links.dart';
import 'package:showtrack/data/model/rating.dart';
import 'package:showtrack/data/model/schedule.dart';

part 'show.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Show {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String status;
  @HiveField(3)
  int? averageRuntime;
  @HiveField(4)
  Schedule? schedule;
  @HiveField(5)
  Rating? rating;
  @HiveField(6)
  Channel? network;
  @HiveField(7)
  Channel? webChannel;
  @HiveField(8)
  ImageBanner? image;
  @HiveField(9)
  String? summary;
  @HiveField(10)
  Links? lLinks;
  @HiveField(11)
  Embedded? eEmbedded;

  Show({
    required this.id,
    required this.name,
    required this.status,
    this.averageRuntime,
    this.schedule,
    this.rating,
    this.network,
    this.webChannel,
    this.image,
    this.summary,
    this.lLinks,
    this.eEmbedded,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  String get formattedSummary =>
      summary?.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '') ?? '';

  StatusEnum getStatusEnum() {
    switch (status) {
      case 'Running':
        return StatusEnum.emExibicao;
      case 'Ended':
        return StatusEnum.finalizada;
      case 'To Be Determined':
        return StatusEnum.emDesenvolvimento;
      default:
        return StatusEnum.desconhecido;
    }
  }

  Color getStatusColor() {
    switch (getStatusEnum()) {
      case StatusEnum.emExibicao:
        return Colors.green;
      case StatusEnum.finalizada:
        return Colors.grey;
      case StatusEnum.emDesenvolvimento:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

enum StatusEnum {
  emExibicao('Em Exibição'),
  finalizada('Finalizada'),
  emDesenvolvimento('Em Desenvolvimento'),
  desconhecido('Desconhecido');

  final String value;

  const StatusEnum(this.value);
}

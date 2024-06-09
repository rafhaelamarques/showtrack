import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showtrack/data/model/channel.dart';
import 'package:showtrack/data/model/embedded.dart';
import 'package:showtrack/data/model/image_banner.dart';
import 'package:showtrack/data/model/links.dart';
import 'package:showtrack/data/model/rating.dart';
import 'package:showtrack/data/model/schedule.dart';
import 'package:showtrack/ui/styles/colors.dart';

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
  @JsonKey(name: '_links')
  Links? links;
  @HiveField(11)
  @JsonKey(name: '_embedded')
  Embedded? embedded;

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
    this.links,
    this.embedded,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  // Remove as tags HTML da sinopse
  String get formattedSummary =>
      summary?.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '') ?? '';

  // examplo: 60 min
  String get runtime =>
      averageRuntime != null ? '$averageRuntime min' : 'Sem informações';

  // Transforma o status da série para um enum
  // com valores em português
  StatusEnum getStatusEnum() {
    switch (status.toLowerCase()) {
      case 'running':
        return StatusEnum.emExibicao;
      case 'ended':
        return StatusEnum.finalizada;
      case 'to be determined':
        return StatusEnum.tba;
      case 'in development':
        return StatusEnum.emDesenvolvimento;
      default:
        return StatusEnum.desconhecido;
    }
  }

  Color getStatusColor() {
    switch (getStatusEnum()) {
      case StatusEnum.emExibicao:
        return AppColors.green;
      case StatusEnum.finalizada:
        return AppColors.grey;
      case StatusEnum.tba:
        return AppColors.orange;
      case StatusEnum.emDesenvolvimento:
        return AppColors.orange;
      default:
        return AppColors.midRed;
    }
  }
}

enum StatusEnum {
  emExibicao('Em Exibição'),
  finalizada('Finalizada'),
  emDesenvolvimento('Em Desenvolvimento'),
  tba('A ser anunciado'),
  desconhecido('Desconhecido');

  final String value;

  const StatusEnum(this.value);
}

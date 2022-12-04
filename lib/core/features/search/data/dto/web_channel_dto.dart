import 'package:showtrack/core/features/search/domain/entities/web_channel_entity.dart';

class WebChannelDto extends WebChannelEntity {
  WebChannelDto({
    required String name,
    required String officialSite,
  }) : super(
          name: name,
          officialSite: officialSite,
        );

  factory WebChannelDto.fromJson(Map<String, dynamic> json) {
    return WebChannelDto(
      name: json['name'] ?? "",
      officialSite: json['officialSite'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'officialSite': officialSite,
    };
  }

  WebChannelDto.empty({
    String name = '',
    String officialSite = '',
  }) : super(
          name: name,
          officialSite: officialSite,
        );
}

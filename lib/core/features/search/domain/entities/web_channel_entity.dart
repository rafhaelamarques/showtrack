class WebChannelEntity {
  String name;
  String officialSite;

  WebChannelEntity({
    required this.name,
    required this.officialSite,
  });

  WebChannelEntity.empty({
    this.name = '',
    this.officialSite = '',
  });
}

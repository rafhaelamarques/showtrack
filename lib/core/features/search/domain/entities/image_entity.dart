class ImageEntity {
  String medium;
  String original;

  ImageEntity({
    required this.medium,
    required this.original,
  });

  ImageEntity.empty({
    this.medium = '',
    this.original = '',
  });
}

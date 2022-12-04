class RatingEntity {
  String average;

  RatingEntity({
    required this.average,
  });

  RatingEntity.empty({
    this.average = '',
  });
}

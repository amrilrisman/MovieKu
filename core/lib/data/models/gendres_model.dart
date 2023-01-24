import 'package:core/domain/entity/genre_entity.dart';

class GendreModels {
  GendreModels({
    required this.genres,
  });

  List<Genre> genres;

  factory GendreModels.fromJson(Map<String, dynamic> json) => GendreModels(
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );
}

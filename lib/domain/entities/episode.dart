// Represent the episode entity
class Episode {
  // Name of the Episode as a `String`.
  final String? name;

  // Runtime of the Episode as a `Duration`.
  final Duration? runTime;

  // Image url year of the Episode as a `String`.
  final String? imageUrl;

  const Episode({
    required this.name,
    required this.runTime,
    required this.imageUrl,
  });

  Episode.from(Episode episode)
      : name = episode.name,
        runTime = episode.runTime,
        imageUrl = episode.imageUrl;

  Episode.fromJson(Map<String, dynamic> map)
      : name = map['name'] as String,
        runTime = map['runTime'] as Duration,
        imageUrl = map['imageUrl'] as String;

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial type.
  Map<String, dynamic> toJson() => {
        'name': name,
        'runTime': runTime,
        'imageUrl': imageUrl,
      };

  /// Convert [this] to a Json `String`. Complex structures keep their initial type.
  Map<String, dynamic> toJson2() => {
        'name': name,
        'runTime': runTime,
        'imageUrl': imageUrl,
      };

  @override
  String toString() =>
      "Episode(name: $name, runTime: $runTime, imageUrl: $imageUrl)";

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Episode &&
            other.name == name &&
            other.runTime == runTime &&
            other.imageUrl == imageUrl);
  }

  @override
  int get hashCode => name.hashCode ^ runTime.hashCode ^ imageUrl.hashCode;
}

import 'package:flutter/material.dart';

// Preview video or trailer
// Video Title, release year, MTRCB Rating, play time
// Play Button
// Synopsis, Cast, Director, Writer
// Add to Watch List icon and Rate icon
// Tabs for Episodes, Trailers & More, More Like This
// a. Episodes Tab - appears only if it is a series, if movie wala ito
// b. Trailers & More Tab - Grid of videos related to this like Trailer 1, Trailer 2, etc.
// c. More Like This Tab - 3 column grid of other movies
class Person {
  final String? fullName;
  final String? castName;
  final String? imageUrl;
  const Person({
    @required this.fullName,
    this.castName,
    @required this.imageUrl,
  });
}

enum FilmType { movie, series, anime }

class Content {
  final String? name;
  final String? imageUrl;
  final String? titleImageUrl;
  final String? videoUrl;
  final String? releaseYear;
  final List<Person>? cast;
  final Person? director;
  final String? rate;
  final Duration? runTime;
  final String? description;
  final List<String>? genre;
  final String? accessibility;
  final Color? color;
  final FilmType? type;

  const Content({
    @required this.name,
    @required this.imageUrl,
    this.titleImageUrl,
    this.videoUrl,
    this.color,
    this.releaseYear,
    this.cast,
    this.director,
    this.rate,
    this.runTime,
    this.description,
    this.genre,
    this.accessibility,
    this.type,
  });
}

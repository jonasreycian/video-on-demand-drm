import 'dart:ui';

import 'package:aq_prime/data/extra/enums.dart';
import 'package:aq_prime/domain/entities/category.dart';
import 'package:aq_prime/domain/entities/sub_category.dart';

import 'episode.dart';
import 'person.dart';

// Represents a single content.
class Content {
  // The content's id as `int`.
  final int id;

  // The content's name as `String`.
  final String? title;

  final String? imageUrl;
  final String? titleImageUrl;
  final String? videoUrl;
  final String? releaseYear;
  final Person? director;
  final String? rate;
  final Duration? runTime;
  final String? description;
  final String? accessibility;
  final Color? color;
  final FilmType? type;
  final bool? isThumbsUp;

  final List<String>? genre;
  final List<Person>? cast;
  final List<Episode>? episode;
  final List<Content>? moreLikeThis;
  final List<Person>? administrator;
  final List<Person>? screenWriter;
  // final List<Subcategory>? subCategory;
  // final List<Category>? category;

  const Content(
    this.id, {
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    this.titleImageUrl,
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
    this.episode,
    this.moreLikeThis,
    this.isThumbsUp,
    this.administrator,
    this.screenWriter,
    // this.subCategory,
    // this.category,
  });

  Content.from(Content content)
      : id = content.id,
        title = content.title,
        imageUrl = content.imageUrl,
        titleImageUrl = content.titleImageUrl,
        videoUrl = content.videoUrl,
        releaseYear = content.releaseYear,
        cast = content.cast,
        director = content.director,
        rate = content.rate,
        runTime = content.runTime,
        description = content.description,
        genre = content.genre,
        accessibility = content.accessibility,
        color = content.color,
        type = content.type,
        episode = content.episode,
        moreLikeThis = content.moreLikeThis,
        isThumbsUp = content.isThumbsUp,
        administrator = content.administrator,
        screenWriter = content.screenWriter;
  // subCategory = content.subCategory,
  // category = content.category;

  Content.fromJson(Map<String, dynamic> map)
      : id = map['id'] as int,
        title = map['title'] as String,
        imageUrl = map['img'] as String,
        titleImageUrl = map['titleImageUrl'] as String,
        videoUrl = map['videoUrl'] as String,
        releaseYear = map['year'] as String,
        director = Person.fromJson(map['director'] as Map<String, dynamic>),
        rate = map['rate'] as String,
        runTime = Duration(seconds: map['runTime'] as int),
        description = map['videoDescription'] as String,
        genre = (map['genre'] as List).map((e) => e as String).toList(),
        accessibility = map['accessibility'] as String,
        color = Color(map['color'] as int),
        type = map['type'] as FilmType,
        isThumbsUp = map['isThumbsUp'] ?? false,
        cast = (map['oyuncuKadrosu'] as List)
            .map((e) => Person.fromJson(e as Map<String, dynamic>))
            .toList(),
        episode = (map['episode'] as List)
            .map((e) => Episode.fromJson(e as Map<String, dynamic>))
            .toList(),
        moreLikeThis = (map['moreLikeThis'] as List)
            .map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        administrator = (map['administrator'] as List)
            .map((e) => Person.fromJson(e as Map<String, dynamic>))
            .toList(),
        screenWriter = (map['senarist'] as List)
            .map((e) => Person.fromJson(e as Map<String, dynamic>))
            .toList();
  // subCategory =
  //     (map['altKategoriler'] as List).map((e) => Subcategory(e)).toList(),
  // category = (map['category'] as List).map((e) => Category(e)).toList();
}

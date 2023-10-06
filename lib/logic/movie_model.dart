import 'package:flutter/foundation.dart';

class MovieModel {
  final List<MovieDetailModel> movies;
  final int total;
  final int limit;
  final int page;
  final int pages;

  MovieModel({
    required this.movies,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        movies: List<MovieDetailModel>.from(
            json["docs"].map((x) => MovieDetailModel.fromJson(x))),
        total: json["total"],
        limit: json["limit"],
        page: json["page"],
        pages: json["pages"],
      );

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.movies, movies) &&
        other.total == total &&
        other.limit == limit &&
        other.page == page &&
        other.pages == pages;
  }

  @override
  int get hashCode {
    return movies.hashCode ^
        total.hashCode ^
        limit.hashCode ^
        page.hashCode ^
        pages.hashCode;
  }

  MovieModel copyWith({
    List<MovieDetailModel>? movies,
    int? total,
    int? limit,
    int? page,
    int? pages,
  }) {
    return MovieModel(
      movies: movies ?? this.movies,
      total: total ?? this.total,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      pages: pages ?? this.pages,
    );
  }
}

class MovieDetailModel {
  final int id;
  final String name;
  final String alternativeName;
  final String enName;
  final List<String> names;
  final String type;
  final int year;
  final String description;
  final String shortDescription;
  final double rating;
  final int votes;
  final int movieLength;
  final List<String> genres;
  final List<String> countries;
  final List<dynamic> releaseYears;

  MovieDetailModel({
    required this.id,
    required this.name,
    required this.alternativeName,
    required this.enName,
    required this.names,
    required this.type,
    required this.year,
    required this.description,
    required this.shortDescription,
    required this.rating,
    required this.votes,
    required this.movieLength,
    required this.genres,
    required this.countries,
    required this.releaseYears,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        id: json["id"],
        name: json["name"],
        alternativeName: json["alternativeName"],
        enName: json["enName"],
        names: List<String>.from(json["names"].map((x) => x)),
        type: json["type"],
        year: json["year"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        rating: json["rating"]?.toDouble(),
        votes: json["votes"],
        movieLength: json["movieLength"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        countries: List<String>.from(json["countries"].map((x) => x)),
        releaseYears: List<dynamic>.from(json["releaseYears"].map((x) => x)),
      );

  @override
  bool operator ==(covariant MovieDetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.alternativeName == alternativeName &&
        other.enName == enName &&
        listEquals(other.names, names) &&
        other.type == type &&
        other.year == year &&
        other.description == description &&
        other.shortDescription == shortDescription &&
        other.rating == rating &&
        other.votes == votes &&
        other.movieLength == movieLength &&
        listEquals(other.genres, genres) &&
        listEquals(other.countries, countries) &&
        listEquals(other.releaseYears, releaseYears);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        alternativeName.hashCode ^
        enName.hashCode ^
        names.hashCode ^
        type.hashCode ^
        year.hashCode ^
        description.hashCode ^
        shortDescription.hashCode ^
        rating.hashCode ^
        votes.hashCode ^
        movieLength.hashCode ^
        genres.hashCode ^
        countries.hashCode ^
        releaseYears.hashCode;
  }
}

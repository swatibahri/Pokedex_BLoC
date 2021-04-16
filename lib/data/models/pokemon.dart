import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pokemon {
  String name;
  String url;
  int id;
  Color color;

  Pokemon({this.name, this.url, this.color});

  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        100, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  Pokemon.fromJson(Map<String, dynamic> json) {
    final paths = json['url'].split('/');
    name = json['name'];
    url = json['url'];
    color = getColor();
    id = paths[paths.length - 2];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}

class PokemonPageResponse {
  final List<Pokemon> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {@required this.pokemonListings, @required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    //print('listing');
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => Pokemon.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}

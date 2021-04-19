import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:pokedex/data/models/poke_detail.dart';
import 'package:pokedex/data/models/pokemon.dart';

import '../../config.dart';

class PokeAPI {
  final Client _client = Client();
  final successCode = 200;

  Uri pokemonDetailUri(int pokemonId) {
    return Uri.https(pokemonAuthority, '$pokeApiBase/pokemon/$pokemonId');
  }

  // Future<KtList<Pokemon>> getPokemonList([int offset = 0]) async {
  //   final perPage = 20;
  //   final Response response =
  //       await _client.get('${pokemonListUri()}?offset=$offset&limit=$perPage');
  //   final decoded = jsonDecode(response.body);
  //   final results = decoded['results'];

  //   // if (response.statusCode == successCode) {
  //   //   return listFrom(results).map((item) => Pokemon.fromJson(item));
  //   // } else {
  //   //   throw Exception('failed to load Pokemon');
  //   // }
  //   try {
  //     return listFrom(results).map((item) => Pokemon.fromJson(item));
  //   } catch (e) {
  //     print(e);
  //   }

  //   // return PokemonPageResponse.fromJson(decoded);
  // }
  Future<PokemonPageResponse> getPokemonList(int pageIndex) async {
    // pokemon?limit=200&offset=400
    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri =
        Uri.https(pokemonAuthority, '$pokeApiBase/pokemon', queryParameters);

    final response = await _client.get(uri);

    // final decoded = jsonDecode(response.body);
    // final results = decoded['results'];
    final decoded = json.decode(response.body);

    // var map1 = Map.fromIterable(results, key: (e) => e.id, value: (e) => e.url);
    // print(results[0]);
    return PokemonPageResponse.fromJson(decoded);
    // print(results.runtimeType);

    // print(results.map((job) => new PokemonPageResponse.fromJson(job)));

    // return results.map((job) => new PokemonPageResponse.fromJson(job));
  }

  Future<PokeDetail> getPokemonDetail([pokemonId]) async {
    // if (response.statusCode == successCode) {
    //   return PokeDetail.fromJson(decoded);
    // } else {
    //   throw Exception("failed to load Pokemon detail");
    // }
    //
    try {
      final Response response = await _client.get(pokemonDetailUri(pokemonId));
      final decoded = jsonDecode(response.body);
      return PokeDetail.fromJson(decoded);
    } catch (e) {
      print(e);
    }
  }
}

final pokeApi = new PokeAPI();

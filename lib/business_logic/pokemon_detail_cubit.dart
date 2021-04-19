import 'package:pokedex/business_logic/services/pokeapi.dart';
import 'package:pokedex/data/models/poke_detail.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokeDetail> {
  final _pokemonRepository = PokeAPI();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    print('dhhj');
    final responses =
        await Future.wait([_pokemonRepository.getPokemonDetail(pokemonId)]);
  print('dhhujgj');
    final pokemonInfo = responses as PokeDetail;

    emit(PokeDetail(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        baseExperience: pokemonInfo.baseExperience,
        order: pokemonInfo.order,
        types: pokemonInfo.types,
        abilities: pokemonInfo.abilities,
        forms: pokemonInfo.forms,
        stats: pokemonInfo.stats));
  }

  void clearPokemonDetails() => emit(null);
}

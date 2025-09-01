import 'package:flutter_pokemon_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/domain.dart';


// * PROVIDER DE POKEMON
final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>((
  ref,
) {
  final fetchPokemons = ref.watch(pokemonProviderInstance).getPokemons;
  return PokemonNotifier(fetchPokemons: fetchPokemons);
});

typedef PokemonCallback =
    Future<List<Pokemon>> Function({int limit, int offset});

class PokemonNotifier extends StateNotifier<List<Pokemon>> {
  final PokemonCallback fetchPokemons;
  PokemonNotifier({required this.fetchPokemons}) : super([]);
  int limit = 20;
  int offset = 0;
  bool isLoading = false;

  Future<List<Pokemon>> fetchPokemonsMethod() async {
    isLoading = true;
    final pokemons = await fetchPokemons(limit: limit, offset: limit * offset);
    offset++;
    state = [...state, ...pokemons];
    isLoading = false;
    return pokemons;
  }
}
import 'package:flutter_pokemon_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/domain.dart';

// * PROVIDER DE POKEMON
final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>((
  ref,                                                                                                                                                                                        
) {
  final fetchPokemons = ref.watch(pokemonProviderInstance).getPokemons;
  final searchPokemons = ref.watch(pokemonProviderInstance).searchPokemons;

  return PokemonNotifier(
    fetchPokemons: fetchPokemons,
    searchPokemons: searchPokemons,
  );
});

typedef PokemonCallback = Future<List<Pokemon>> Function({int limit, int offset});
typedef SearchPokemonCallback = Future<List<Pokemon>> Function(String query);

class PokemonNotifier extends StateNotifier<List<Pokemon>> {
  final PokemonCallback fetchPokemons;
  final SearchPokemonCallback searchPokemons;

  PokemonNotifier({required this.fetchPokemons, required this.searchPokemons})
    : super([]);

  int limit = 20;
  int offset = 0;
  bool isLoading = false;


  List<Pokemon> searchResults = [];
  bool isSearching = false;


  Future<List<Pokemon>> fetchPokemonsMethod() async {
    isLoading = true;
    final pokemons = await fetchPokemons(limit: limit, offset: limit * offset);
    offset++;
    state = [...state, ...pokemons];
    isLoading = false;
    return pokemons;
  }

  Future<void> searchPokemonsMethod(String query) async {
    if (query.isEmpty) {
      offset = 0;
      state = [];
      isSearching = false;
      await fetchPokemonsMethod(); 
      return;
    }

    isSearching = true;
    try {
      final results = await searchPokemons(query);
      state = results; 
    } catch (e) {
      state = [];
    }
  }
}

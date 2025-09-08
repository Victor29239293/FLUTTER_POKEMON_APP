import 'package:flutter_pokemon_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorite_pokemon_intance.dart';

final favoritePokemonProvider = StateNotifierProvider<FavoritePokemonNotifier, List<Pokemon>>((ref) {
  final getFavorite = ref.watch(favoritePokemonProviderInstance).getFavoritePokemons;

  return FavoritePokemonNotifier(getFavorite: getFavorite);
});

typedef FavoriteIdsCallback = Future<List<Pokemon>> Function();

class FavoritePokemonNotifier extends StateNotifier<List<Pokemon>> {
  final FavoriteIdsCallback getFavorite;
  bool isLoading = false;

  FavoritePokemonNotifier({required this.getFavorite}) : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading = true;
    final ids = await getFavorite();
    state = ids;
    isLoading = false;
  }

 
}

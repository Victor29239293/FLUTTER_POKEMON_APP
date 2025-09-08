import '../domain.dart';

abstract class FavoritePokemonDataSource {
  Future<List<Pokemon>> getFavoritePokemons();
  Future<void> addFavoritePokemon(int id);
  Future<void> removeFavoritePokemon(int id);
  Future<bool> isFavoritePokemon(int id);
}
import 'package:flutter_pokemon_app/domain/datasource/favorite_pokemon_datasource.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_app/infrastructure/mappers/pokemon_mappers.dart';
import 'package:flutter_pokemon_app/infrastructure/models/pokemon_list_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class FavoritePokemonDatasourceImpl implements FavoritePokemonDataSource {
  static const String _key = 'favorite_pokemons';
  final dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<List<Pokemon>> getFavoritePokemons() async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList(_key) ?? [];

    List<Pokemon> pokemons = [];

    for (var id in favorites) {
      try {
        final response = await dio.get('pokemon/$id');
        final pokemon = PokemonMapper.toEntity(PokemonResult.fromJson(response.data));

        pokemons.add(pokemon);
      } catch (e) {
        print('Error al obtener el pokemon $id: $e');
      }
    }

    return pokemons;
  }

  @override
  Future<void> addFavoritePokemon(int id) async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList(_key) ?? [];

    if (!favorites.contains(id.toString())) {
      favorites.add(id.toString());
      await prefs.setStringList(_key, favorites);
      print('Added $id to favorites: $favorites');
    }
  }

  @override
  Future<void> removeFavoritePokemon(int id) async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList(_key) ?? [];

    if (favorites.contains(id.toString())) {
      favorites.remove(id.toString());
      await prefs.setStringList(_key, favorites);
      print('Removed $id from favorites: $favorites');
    }
  }

  @override
  Future<bool> isFavoritePokemon(int id) async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList(_key) ?? [];
    return favorites.contains(id.toString());
  }
}

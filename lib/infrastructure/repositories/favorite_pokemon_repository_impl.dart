import 'package:flutter_pokemon_app/domain/datasource/favorite_pokemon_datasource.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_app/domain/repositories/favorite_pokemon_repositories.dart';

class FavoritePokemonRepositoryImpl implements FavoritePokemonRepositories {


  final FavoritePokemonDataSource datasource;
  FavoritePokemonRepositoryImpl(this.datasource);

  
  @override
  Future<List<Pokemon>> getFavoritePokemons() {
    return datasource.getFavoritePokemons();
  }

  @override
  Future<void> addFavoritePokemon(int id) {
    return datasource.addFavoritePokemon(id);
  }

  @override
  Future<void> removeFavoritePokemon(int id) {
    return datasource.removeFavoritePokemon(id);
   

  }

  @override
  Future<bool> isFavoritePokemon(int id) {
    return datasource.isFavoritePokemon(id);
    
  }

  
}

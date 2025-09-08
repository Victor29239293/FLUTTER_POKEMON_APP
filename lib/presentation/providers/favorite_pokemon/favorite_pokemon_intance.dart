import 'package:flutter_pokemon_app/infrastructure/datasource/favorite_pokemon_datasource_impl.dart';
import 'package:flutter_pokemon_app/infrastructure/repositories/favorite_pokemon_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
// * PROVIDER DE POKEMON INSTANCE
final favoritePokemonProviderInstance = Provider((ref) {
  return FavoritePokemonRepositoryImpl(FavoritePokemonDatasourceImpl());
});

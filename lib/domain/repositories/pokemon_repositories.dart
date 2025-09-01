import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
  Future<Pokemon> getPokemonById(int id);
  Future<List<Pokemon>> getPokemonsByType(String type);
}

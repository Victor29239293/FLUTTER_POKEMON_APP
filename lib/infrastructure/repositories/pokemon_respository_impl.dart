import '../../domain/datasource/pokemon_datasource.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repositories.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  final PokemonDataSource datasource;

  PokemonRepositoryImpl({required this.datasource});

  @override
  Future<List<Pokemon>> getPokemons() {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }

  @override
  Future<Pokemon> getPokemonById(int id) {
    // TODO: implement getPokemonById
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type) {
    // TODO: implement getPokemonsByType
    throw UnimplementedError();
  }
}
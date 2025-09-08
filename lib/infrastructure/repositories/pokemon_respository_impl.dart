import '../../domain/domain.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  final PokemonDataSource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<List<Pokemon>> getPokemons({int limit = 10, int offset = 20}) {
    return datasource.getPokemons(limit: limit, offset: offset);
  }
  @override
  Future<Pokemon> getPokemonById(int id) {
    return datasource.getPokemonById(id);
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type) {
    return datasource.getPokemonsByType(type);
   
  }
  @override
  Future<List<Pokemon>> searchPokemons(String query) {
    return datasource.searchPokemons(query);
  }

  
}
import 'package:dio/dio.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class PokemonDatasourceImpl implements PokemonDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      // connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 3),
    ),
  );

  @override
  Future<List<Pokemon>> getPokemons({int limit = 10, int offset = 0}) async {
    final response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    final results = response.data['results'] as List;
    const int batchSize = 5;
    const Duration delay = Duration(seconds: 1);
    List<Pokemon> pokemones = [];

    for (int i = 0; i < results.length; i += batchSize) {
      final batch = results.skip(i).take(batchSize).toList();
      final futures = batch.asMap().entries.map((entry) {
        final index = i + entry.key + 1 + offset;
        return dio.get('pokemon/$index');
      }).toList();

      final responses = await Future.wait(futures);
      pokemones.addAll(
        responses.map(
          (res) => PokemonMapper.toEntity(PokemonResult.fromJson(res.data)),
        ),
      );

      if (i + batchSize < results.length) {
        await Future.delayed(delay);
      }
    }
    return pokemones;
  }

  @override
  Future<Pokemon> getPokemonById(int id) async {
    try {
      final response = await dio.get('pokemon/$id');
      final pokemonResult = PokemonResult.fromJson(response.data);
      final pokemon = PokemonMapper.toEntity(pokemonResult);
      return pokemon;
    } catch (e) {
      throw Exception('Error al obtener Pokémon con id $id: $e');
    }
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type) {
    // TODO: implement getPokemonsByType
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> searchPokemons(String query) async {
    final response = await dio.get('pokemon', queryParameters: {'limit': 100});
    final results = response.data['results'] as List;

    final filtered = results.where((item) {
      final name = item['name'] as String;
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    const int batchSize = 5;
    const Duration delay = Duration(milliseconds: 500);
    List<Pokemon> pokemones = [];

    for (int i = 0; i < filtered.length; i += batchSize) {
      final batch = filtered.skip(i).take(batchSize).toList();
      final futures = batch.map((item) {
        final url = item['url'] as String;
        return dio.get(url);
      }).toList();

      final responses = await Future.wait(futures);
      pokemones.addAll(
        responses.map(
          (res) => PokemonMapper.toEntity(PokemonResult.fromJson(res.data)),
        ),
      );

      if (i + batchSize < filtered.length) {
        await Future.delayed(delay);
      }
    }

    return pokemones;
  }
}

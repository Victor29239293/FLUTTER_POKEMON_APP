import 'package:dio/dio.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';


class PokemonDatasourceImpl implements PokemonDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
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

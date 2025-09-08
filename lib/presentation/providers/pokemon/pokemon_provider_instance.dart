import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infrastructure/infrastructure.dart';

// * PROVIDER DE POKEMON INSTANCE
final pokemonProviderInstance = Provider((ref) {
  return PokemonRepositoryImpl(PokemonDatasourceImpl());
});

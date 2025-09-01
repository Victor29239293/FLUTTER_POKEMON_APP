import '../../domain/domain.dart';
import '../infrastructure.dart';

class PokemonMapper {
  static Pokemon toEntity(PokemonResult pokemon) => Pokemon(
    id: pokemon.id,
    name: pokemon.name,
    abilities: pokemon.abilities.map(toEntityAbility).toList(),
    cries: toEntityCries(pokemon.cries),
    species: toEntitySpecies(pokemon.species),
    baseExperience: pokemon.baseExperience,
    forms: pokemon.forms.map(toEntitySpecies).toList(),
    gameIndices: pokemon.gameIndices.map(toEntityGameIndex).toList(),
    height: pokemon.height,
    heldItems: pokemon.heldItems,
    isDefault: pokemon.isDefault,
    locationAreaEncounters: pokemon.locationAreaEncounters,
    moves: pokemon.moves.map(toEntityMove).toList(),
    order: pokemon.order,
    pastAbilities: pokemon.pastAbilities.map(toEntityPastAbility).toList(),
    pastTypes: pokemon.pastTypes,
    sprites: toEntitySprites(pokemon.sprites),
    stats: pokemon.stats.map(toEntityStat).toList(),
    types: pokemon.types.map(toEntityType).toList(),
    weight: pokemon.weight,
  );

  static Ability toEntityAbility(AbilityResult ability) => Ability(
    ability: ability.ability != null
        ? Species(name: ability.ability!.name, url: ability.ability!.url)
        : null,
    isHidden: ability.isHidden,
    slot: ability.slot,
  );


  static Stat toEntityStat(StatResult stat) => Stat(
    baseStat: stat.baseStat,
    effort: stat.effort,
    stat: toEntitySpecies(stat.stat),
  );

  static PastAbility toEntityPastAbility(PastAbilityResult passAbility) =>
      PastAbility(
        abilities: passAbility.abilities.map(toEntityAbility).toList(),
        generation: toEntitySpecies(passAbility.generation),
      );

  static Cries toEntityCries(CriesResult cries) =>
      Cries(latest: cries.latest, legacy: cries.legacy);

  static Species toEntitySpecies(SpeciesResult species) =>
      Species(name: species.name, url: species.url);

  static GameIndex toEntityGameIndex(GameIndexResult gameIndex) => GameIndex(
    gameIndex: gameIndex.gameIndex,
    version: toEntitySpecies(gameIndex.version),
  );

  static Move toEntityMove(MoveResult move) => Move(
    move: toEntitySpecies(move.move),
    versionGroupDetails: move.versionGroupDetails
        .map(toEntityVersionGroupDetail)
        .toList(),
  );

  static VersionGroupDetail toEntityVersionGroupDetail(
    VersionGroupDetailResult versionGroupDetail,
  ) => VersionGroupDetail(
    levelLearnedAt: versionGroupDetail.levelLearnedAt,
    moveLearnMethod: toEntitySpecies(versionGroupDetail.moveLearnMethod),
    order: versionGroupDetail.order,
    versionGroup: toEntitySpecies(versionGroupDetail.versionGroup),
  );

  static Sprites toEntitySprites(SpritesResult sprites) => Sprites(
    backDefault: sprites.backDefault,
    backShiny: sprites.backShiny,
    frontDefault: sprites.frontDefault,
    frontShiny: sprites.frontShiny,
  );
  static Type toEntityType(TypeResult type) =>
      Type(slot: type.slot, type: toEntitySpecies(type.type));
}

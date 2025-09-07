class Pokemon {
  final List<Ability> abilities;
  final int baseExperience;
  final Cries cries;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<PastAbility> pastAbilities;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });
}

// Atributos de apoyo (solo definición de clase y atributos)
class Ability {
  final Species? ability;
  final bool isHidden;
  final int slot;

  Ability({this.ability, required this.isHidden, required this.slot});
}

class Species {
  final String name;
  final String url;

  Species({required this.name, required this.url});
}

class Cries {
  final String latest;
  final String legacy;

  Cries({required this.latest, required this.legacy});
}

class GameIndex {
  final int gameIndex;
  final Species version;

  GameIndex({required this.gameIndex, required this.version});
}

class Move {
  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({required this.move, required this.versionGroupDetails});
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final Species moveLearnMethod;
  final int? order;
  final Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    this.order,
    required this.versionGroup,
  });
}

class PastAbility {
  final List<Ability> abilities;
  final Species generation;

  PastAbility({required this.abilities, required this.generation});
}

class Sprites {
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Other other;
  final Versions? versions;
  final Sprites? animated;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    required this.other,
    this.versions,
    this.animated,
  });
}

class Other {
  final DreamWorld dreamWorld;
  final Home? home;
  final OfficialArtwork? officialArtwork;
  final Showdown? showdown;

  Other({
    required this.dreamWorld,
    this.home,
    this.officialArtwork,
     this.showdown,
  });
}

class Versions {
  get generationI => null;
   
}

class Stat {
  final int baseStat;
  final int effort;
  final Species stat;

  Stat({required this.baseStat, required this.effort, required this.stat});
}

class Type {
  final int slot;
  final Species type;

  Type({required this.slot, required this.type});
}

class DreamWorld {
  final String frontDefault;
  final dynamic frontFemale;

  DreamWorld({required this.frontDefault, this.frontFemale});
}

class Home {
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({required this.frontDefault, required this.frontShiny});
}


class Showdown {
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
 

  Showdown({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    
  });
}
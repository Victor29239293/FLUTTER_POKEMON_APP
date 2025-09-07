class PokemonListResponse {
  final int count;
  final String next;
  final dynamic previous;
  final List<PokemonResult> results;

  PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      PokemonListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonResult>.from(
          json["results"].map((x) => PokemonResult.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class PokemonResult {
  final List<AbilityResult> abilities;
  final int baseExperience;
  final CriesResult cries;
  final List<SpeciesResult> forms;
  final List<GameIndexResult> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<MoveResult> moves;
  final String name;
  final int order;
  final List<PastAbilityResult> pastAbilities;
  final List<dynamic> pastTypes;
  final SpeciesResult species;
  final SpritesResult sprites;
  final List<StatResult> stats;
  final List<TypeResult> types;
  final int weight;

  PokemonResult({
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

  factory PokemonResult.fromJson(Map<String, dynamic> json) => PokemonResult(
    abilities: List<AbilityResult>.from(
      json["abilities"].map((x) => AbilityResult.fromJson(x)),
    ),

    baseExperience: json["base_experience"],
    cries: CriesResult.fromJson(json["cries"]),
    forms: List<SpeciesResult>.from(
      json["forms"].map((x) => SpeciesResult.fromJson(x)),
    ),
    gameIndices: List<GameIndexResult>.from(
      json["game_indices"].map((x) => GameIndexResult.fromJson(x)),
    ),
    height: json["height"],
    heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<MoveResult>.from(
      json["moves"].map((x) => MoveResult.fromJson(x)),
    ),
    name: json["name"],
    order: json["order"],
    pastAbilities: List<PastAbilityResult>.from(
      json["past_abilities"].map((x) => PastAbilityResult.fromJson(x)),
    ),
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: SpeciesResult.fromJson(json["species"]),
    sprites: SpritesResult.fromJson(json["sprites"]),
    stats: List<StatResult>.from(
      json["stats"].map((x) => StatResult.fromJson(x)),
    ),
    types: List<TypeResult>.from(
      json["types"].map((x) => TypeResult.fromJson(x)),
    ),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "base_experience": baseExperience,
    "cries": cries.toJson(),
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
    "height": height,
    "held_items": List<dynamic>.from(heldItems.map((x) => x)),
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    "name": name,
    "order": order,
    "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x.toJson())),
    "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    "species": species.toJson(),
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "weight": weight,
  };
}

class AbilityResult {
  final SpeciesResult? ability;
  final bool isHidden;
  final int slot;

  AbilityResult({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityResult.fromJson(Map<String, dynamic> json) => AbilityResult(
    ability: json["ability"] == null
        ? null
        : SpeciesResult.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability?.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class SpeciesResult {
  final String name;
  final String url;

  SpeciesResult({required this.name, required this.url});

  factory SpeciesResult.fromJson(Map<String, dynamic> json) =>
      SpeciesResult(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class CriesResult {
  final String latest;
  final String legacy;

  CriesResult({required this.latest, required this.legacy});

  factory CriesResult.fromJson(Map<String, dynamic> json) =>
      CriesResult(latest: json["latest"], legacy: json["legacy"]);

  Map<String, dynamic> toJson() => {"latest": latest, "legacy": legacy};
}

class GameIndexResult {
  final int gameIndex;
  final SpeciesResult version;

  GameIndexResult({required this.gameIndex, required this.version});

  factory GameIndexResult.fromJson(Map<String, dynamic> json) =>
      GameIndexResult(
        gameIndex: json["game_index"],
        version: SpeciesResult.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
    "game_index": gameIndex,
    "version": version.toJson(),
  };
}

class MoveResult {
  final SpeciesResult move;
  final List<VersionGroupDetailResult> versionGroupDetails;

  MoveResult({required this.move, required this.versionGroupDetails});

  factory MoveResult.fromJson(Map<String, dynamic> json) => MoveResult(
    move: SpeciesResult.fromJson(json["move"]),
    versionGroupDetails: List<VersionGroupDetailResult>.from(
      json["version_group_details"].map(
        (x) => VersionGroupDetailResult.fromJson(x),
      ),
    ),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
    "version_group_details": List<dynamic>.from(
      versionGroupDetails.map((x) => x.toJson()),
    ),
  };
}

class VersionGroupDetailResult {
  final int levelLearnedAt;
  final SpeciesResult moveLearnMethod;
  final int? order;
  final SpeciesResult versionGroup;

  VersionGroupDetailResult({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.order,
    required this.versionGroup,
  });

  factory VersionGroupDetailResult.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetailResult(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: SpeciesResult.fromJson(json["move_learn_method"]),
        order: json["order"],
        versionGroup: SpeciesResult.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
    "level_learned_at": levelLearnedAt,
    "move_learn_method": moveLearnMethod.toJson(),
    "order": order,
    "version_group": versionGroup.toJson(),
  };
}

class PastAbilityResult {
  final List<AbilityResult> abilities;
  final SpeciesResult generation;

  PastAbilityResult({required this.abilities, required this.generation});

  factory PastAbilityResult.fromJson(Map<String, dynamic> json) =>
      PastAbilityResult(
        abilities: List<AbilityResult>.from(
          json["abilities"].map((x) => AbilityResult.fromJson(x)),
        ),
        generation: SpeciesResult.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "generation": generation.toJson(),
  };
}

class GenerationV {
  final SpritesResult blackWhite;

  GenerationV({required this.blackWhite});

  factory GenerationV.fromJson(Map<String, dynamic> json) =>
      GenerationV(blackWhite: SpritesResult.fromJson(json["black-white"]));

  Map<String, dynamic> toJson() => {"black-white": blackWhite.toJson()};
}

class GenerationIv {
  final SpritesResult diamondPearl;
  final SpritesResult heartgoldSoulsilver;
  final SpritesResult platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
    diamondPearl: SpritesResult.fromJson(json["diamond-pearl"]),
    heartgoldSoulsilver: SpritesResult.fromJson(json["heartgold-soulsilver"]),
    platinum: SpritesResult.fromJson(json["platinum"]),
  );

  Map<String, dynamic> toJson() => {
    "diamond-pearl": diamondPearl.toJson(),
    "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
    "platinum": platinum.toJson(),
  };
}

class Versions {
  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, Home> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    generationI: GenerationI.fromJson(json["generation-i"]),
    generationIi: GenerationIi.fromJson(json["generation-ii"]),
    generationIii: GenerationIii.fromJson(json["generation-iii"]),
    generationIv: GenerationIv.fromJson(json["generation-iv"]),
    generationV: GenerationV.fromJson(json["generation-v"]),
    generationVi: Map.from(
      json["generation-vi"],
    ).map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
    generationVii: GenerationVii.fromJson(json["generation-vii"]),
    generationViii: GenerationViii.fromJson(json["generation-viii"]),
  );

  Map<String, dynamic> toJson() => {
    "generation-i": generationI.toJson(),
    "generation-ii": generationIi.toJson(),
    "generation-iii": generationIii.toJson(),
    "generation-iv": generationIv.toJson(),
    "generation-v": generationV.toJson(),
    "generation-vi": Map.from(
      generationVi,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "generation-vii": generationVii.toJson(),
    "generation-viii": generationViii.toJson(),
  };
}

class Other {
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;
  final ShowdownResult showdown;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    home: Home.fromJson(json["home"]),
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
    showdown: ShowdownResult.fromJson(json["showdown"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "home": home.toJson(),
    "official-artwork": officialArtwork.toJson(),
    "showdown": showdown.toJson(),
  };
}

class SpritesResult {
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final OtherResult other;
  final Versions? versions;
  final SpritesResult? animated;

  SpritesResult({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    this.versions,
    this.animated,
  });

  factory SpritesResult.fromJson(Map<String, dynamic> json) => SpritesResult(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: json["other"] == null
        ? OtherResult.fromJson({
            "dream_world": {"front_default": "", "front_female": null},
            "home": null,
            "official-artwork": null,
            "showdown": null,
          })
        : OtherResult.fromJson(json["other"]),
    versions: json["versions"] == null
        ? null
        : Versions.fromJson(json["versions"]),
    animated: json["animated"] == null
        ? null
        : SpritesResult.fromJson(json["animated"]),
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other.toJson(),
    "versions": versions?.toJson(),
    "animated": animated?.toJson(),
  };
}

class GenerationI {
  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI({required this.redBlue, required this.yellow});

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
    redBlue: RedBlue.fromJson(json["red-blue"]),
    yellow: RedBlue.fromJson(json["yellow"]),
  );

  Map<String, dynamic> toJson() => {
    "red-blue": redBlue.toJson(),
    "yellow": yellow.toJson(),
  };
}

class RedBlue {
  final String backDefault;
  final String backGray;
  final String backTransparent;
  final String frontDefault;
  final String frontGray;
  final String frontTransparent;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
    backDefault: json["back_default"],
    backGray: json["back_gray"],
    backTransparent: json["back_transparent"],
    frontDefault: json["front_default"],
    frontGray: json["front_gray"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_gray": backGray,
    "back_transparent": backTransparent,
    "front_default": frontDefault,
    "front_gray": frontGray,
    "front_transparent": frontTransparent,
  };
}

class GenerationIi {
  final Crystal crystal;
  final Gold gold;
  final Gold silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
    crystal: Crystal.fromJson(json["crystal"]),
    gold: Gold.fromJson(json["gold"]),
    silver: Gold.fromJson(json["silver"]),
  );

  Map<String, dynamic> toJson() => {
    "crystal": crystal.toJson(),
    "gold": gold.toJson(),
    "silver": silver.toJson(),
  };
}

class Crystal {
  final String backDefault;
  final String backShiny;
  final String backShinyTransparent;
  final String backTransparent;
  final String frontDefault;
  final String frontShiny;
  final String frontShinyTransparent;
  final String frontTransparent;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    backShinyTransparent: json["back_shiny_transparent"],
    backTransparent: json["back_transparent"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
    frontShinyTransparent: json["front_shiny_transparent"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "back_shiny_transparent": backShinyTransparent,
    "back_transparent": backTransparent,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
    "front_shiny_transparent": frontShinyTransparent,
    "front_transparent": frontTransparent,
  };
}

class Gold {
  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;
  final String? frontTransparent;

  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
    "front_transparent": frontTransparent,
  };
}

class GenerationIii {
  final OfficialArtwork emerald;
  final Gold fireredLeafgreen;
  final Gold rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
    emerald: OfficialArtwork.fromJson(json["emerald"]),
    fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
    rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
  );

  Map<String, dynamic> toJson() => {
    "emerald": emerald.toJson(),
    "firered-leafgreen": fireredLeafgreen.toJson(),
    "ruby-sapphire": rubySapphire.toJson(),
  };
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({required this.frontDefault, required this.frontShiny});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

class Home {
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class HomeResult {
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  HomeResult({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory HomeResult.fromJson(Map<String, dynamic> json) => HomeResult(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class GenerationVii {
  final DreamWorld icons;
  final Home ultraSunUltraMoon;

  GenerationVii({required this.icons, required this.ultraSunUltraMoon});

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
    icons: DreamWorld.fromJson(json["icons"]),
    ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
    "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
  };
}

class DreamWorld {
  final String frontDefault;
  final dynamic frontFemale;

  DreamWorld({required this.frontDefault, required this.frontFemale});

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class DreamWorldResult {
  final String frontDefault;
  final dynamic frontFemale;

  DreamWorldResult({required this.frontDefault, required this.frontFemale});

  factory DreamWorldResult.fromJson(Map<String, dynamic> json) =>
      DreamWorldResult(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class GenerationViii {
  final DreamWorld icons;

  GenerationViii({required this.icons});

  factory GenerationViii.fromJson(Map<String, dynamic> json) =>
      GenerationViii(icons: DreamWorld.fromJson(json["icons"]));

  Map<String, dynamic> toJson() => {"icons": icons.toJson()};
}

class StatResult {
  final int baseStat;
  final int effort;
  final SpeciesResult stat;

  StatResult({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatResult.fromJson(Map<String, dynamic> json) => StatResult(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: SpeciesResult.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class TypeResult {
  final int slot;
  final SpeciesResult type;

  TypeResult({required this.slot, required this.type});

  factory TypeResult.fromJson(Map<String, dynamic> json) => TypeResult(
    slot: json["slot"],
    type: SpeciesResult.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {"slot": slot, "type": type.toJson()};
}

class OtherResult {
  final DreamWorldResult dreamWorld;
  final HomeResult? home;
  final OfficialArtwork? officialArtwork;
  final ShowdownResult? showdown; 

  OtherResult({
    required this.dreamWorld,
    this.home,
    this.officialArtwork,
    required this.showdown, 
  });

  factory OtherResult.fromJson(Map<String, dynamic> json) => OtherResult(
    dreamWorld: DreamWorldResult.fromJson(json["dream_world"]),
    home: json["home"] == null ? null : HomeResult.fromJson(json["home"]),
    officialArtwork: json["official-artwork"] == null
        ? null
        : OfficialArtwork.fromJson(json["official-artwork"]),
    showdown: json["showdown"] == null ? null : ShowdownResult.fromJson(json["showdown"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "home": home?.toJson(),
    "official-artwork": officialArtwork?.toJson(),
    "showdown": showdown?.toJson(), // Opcional
  };
}

class ShowdownResult {
  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;

  ShowdownResult({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });

  factory ShowdownResult.fromJson(Map<String, dynamic> json) => ShowdownResult(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

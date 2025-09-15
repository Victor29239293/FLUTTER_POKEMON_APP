import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/config/constants/constants.dart';
import 'package:flutter_pokemon_app/infrastructure/datasource/favorite_pokemon_datasource_impl.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_description.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_title_image.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_type.dart';
import 'package:flutter_pokemon_app/utils/pokemon_type_utilis.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/domain.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String selectedImageUrl;
  final FavoritePokemonDatasourceImpl favoritesDatasource =
      FavoritePokemonDatasourceImpl();
  bool isFavorite = false;
  bool isPlaying = false;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    selectedImageUrl = widget.pokemon.sprites.other.dreamWorld.frontDefault;

    favoritesDatasource.isFavoritePokemon(widget.pokemon.id).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
    player.setUrl(
      'https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/${widget.pokemon.id}.ogg',
    );
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        player.pause();
        setState(() {
          isPlaying = false;
        });
        player.seek(Duration.zero); // Opcional: vuelve al inicio
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: getTypeColor(
        widget.pokemon.types[0].type.name,
      ).withOpacity(0.8),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (isFavorite) {
                await favoritesDatasource.removeFavoritePokemon(
                  widget.pokemon.id,
                );
                setState(() {
                  isFavorite = false;
                });
              } else {
                await favoritesDatasource.addFavoritePokemon(widget.pokemon.id);
                setState(() {
                  isFavorite = true;
                });
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: kDefaultPaddin / 2),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.pokemon.name.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: const Color.fromARGB(
                                            255,
                                            0,
                                            0,
                                            0,
                                          ),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (isPlaying) {
                                        player.pause();
                                        setState(() {
                                          isPlaying = false;
                                        });
                                      } else {
                                        player.play();
                                        setState(() {
                                          isPlaying = true;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause_circle
                                          :
                                      Icons.play_circle,
                                      color: Colors.grey.shade900,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: kDefaultPaddin),
                              Text(
                                'N°${widget.pokemon.id}',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(138, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: kDefaultPaddin),
                              PokemonType(pokemon: widget.pokemon),
                              SizedBox(height: kDefaultPaddin / 2),

                              Text(
                                'VERSIONES',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: kDefaultPaddin / 2),
                              _buildPokemonVersions(),
                              SizedBox(height: kDefaultPaddin),

                              PokemonDescription(pokemon: widget.pokemon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(
                    pokemon: widget.pokemon,
                    customImageUrl: selectedImageUrl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonVersions() {
    final sprites = widget.pokemon.sprites;
    final List<_VersionImage> versions = [
      _VersionImage(
        label: 'Dream World',
        url: sprites.other.dreamWorld.frontDefault,
      ),

      // if (sprites.frontShiny.isNotEmpty)
      //   _VersionImage(label: 'Shiny', url: sprites.frontShiny),
      if (sprites.other.showdown?.frontDefault != null &&
          sprites.other.showdown!.frontDefault.isNotEmpty)
        _VersionImage(label: 'Gif', url: sprites.other.showdown!.frontDefault),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: versions.map((version) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedImageUrl = version.url;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedImageUrl == version.url
                    ? Colors.blue
                    : Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                version.url.endsWith('.svg')
                    ? SvgPicture.network(
                        version.url,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        placeholderBuilder: (context) => const Icon(
                          Icons.catching_pokemon,
                          size: 32,
                          color: Colors.grey,
                        ),
                      )
                    : Image.network(
                        version.url,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.catching_pokemon,
                              size: 32,
                              color: Colors.grey,
                            ),
                      ),
                const SizedBox(height: 4),
                Text(
                  version.label,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _VersionImage {
  final String label;
  final String url;
  _VersionImage({required this.label, required this.url});
}

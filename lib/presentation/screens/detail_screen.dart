import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/config/constants/constants.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_description.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_title_image.dart';
import 'package:flutter_pokemon_app/presentation/widgets/pokemon_type.dart';
// // import 'package:flutter_svg/svg.dart';

// import '../../config/config.dart';
import '../../domain/domain.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String selectedImageUrl;

  @override
  void initState() {
    super.initState();
    // Inicializar con la imagen frontal normal
    selectedImageUrl = widget.pokemon.sprites.frontDefault;
  }

  Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Color(0xFF4CAF50);
      case 'fire':
        return Color(0xFFFF5722);
      case 'water':
        return Color(0xFF2196F3);
      case 'bug':
        return Color(0xFF8BC34A);
      default:
        return Color(0xFF4CAF50);
    }
  }

  // void _onVersionSelected(String imageUrl) {
  //   setState(() {
  //     selectedImageUrl = imageUrl;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // each product have a color
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
            onPressed: () {},
            icon: Icon(Icons.favorite_border_rounded, color: Colors.white),
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
                              Text(
                                widget.pokemon.name.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
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
                  // Pasar la imagen seleccionada al widget de imagen principal
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
      _VersionImage(label: 'Normal', url: sprites.frontDefault),
      if (sprites.frontShiny.isNotEmpty)
        _VersionImage(label: 'Shiny', url: sprites.frontShiny),
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
                Image.network(
                  version.url,
                  height: 48,
                  width: 48,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
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

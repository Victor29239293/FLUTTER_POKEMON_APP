import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  final String? customImageUrl;
  final Pokemon pokemon;
  final double? imageSize;

  const ProductTitleWithImage({
    super.key,
    required this.pokemon,
    this.customImageUrl,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final double maxImageSize =
        imageSize ?? MediaQuery.of(context).size.width * 0.80;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: "${pokemon.id}",
                  child: Center(
                    child: SizedBox(
                      height: maxImageSize,
                      width: maxImageSize,
                      child:
                          (customImageUrl ??
                                  pokemon.sprites.other.dreamWorld.frontDefault)
                              .endsWith('.svg')
                          ? SvgPicture.network(
                              customImageUrl ??
                                  pokemon.sprites.other.dreamWorld.frontDefault,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(child: Icon(Icons.error)),
                            )
                          : SizedBox(
                              height: 150, // fijo en px
                              width: 150,
                              child: Image.network(
                                customImageUrl ??
                                    pokemon
                                        .sprites
                                        .other
                                        .dreamWorld
                                        .frontDefault,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(child: Icon(Icons.error)),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

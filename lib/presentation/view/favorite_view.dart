import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_pokemon_app/presentation/providers/pokemon/pokemon_provider_state.dart';
import 'package:flutter_pokemon_app/presentation/widgets/item_card.dart';
import 'package:flutter_pokemon_app/utils/pokemon_skeleton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokemon_app/domain/domain.dart';
import 'package:flutter_pokemon_app/presentation/providers/favorite_pokemon/favorite_pokemon_intance.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getFavorites = ref
        .watch(favoritePokemonProviderInstance)
        .getFavoritePokemons;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red,size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyState();
          } else {
            return FavoritePokemon(pokemones: snapshot.data!, isLoading: false);
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png',
            width: 150,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your Favorites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'You have no favorite items yet.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class FavoritePokemon extends StatefulWidget {
  final List<Pokemon> pokemones;
  final bool isLoading;
  final VoidCallback? loadNextPage;

  const FavoritePokemon({
    super.key,
    required this.pokemones,
    this.loadNextPage,
    required this.isLoading,
  });

  @override
  State<FavoritePokemon> createState() => _FavoritePokemonState();
}

class _FavoritePokemonState extends State<FavoritePokemon> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((_controller.position.pixels + 100) >=
          _controller.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: _controller,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        itemCount: widget.pokemones.length,
        crossAxisCount: 3,
        itemBuilder: (context, index) {
          if (widget.isLoading) {
            return Center(child: ItemCardSkeleton());
          }
          return FadeInUp(
            from: random.nextInt(100) + 80,
            delay: Duration(milliseconds: random.nextInt(450) + 0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color.fromARGB(255, 2, 51, 124),
                              const Color.fromARGB(255, 30, 80, 150),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: CustomPaint(painter: PokeBallPatternPainter()),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      top: 50,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final cardWidth =
                              MediaQuery.of(context).size.width - 32;
                          const cardHeight = 200.0;
                          final maxImgWidth = cardWidth * 0.30;
                          final maxImgHeight = cardHeight * 0.45;
                          final imageSize = maxImgWidth < maxImgHeight
                              ? maxImgWidth
                              : maxImgHeight;
                          return Hero(
                            tag: "${widget.pokemones[index].id}",
                            child: Container(
                              height: imageSize,
                              width: imageSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: SvgPicture.network(
                                  widget
                                      .pokemones[index]
                                      .sprites
                                      .other
                                      .dreamWorld
                                      .frontDefault,
                                  height: imageSize,
                                  width: imageSize,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.catching_pokemon,
                                        color: Colors.white54,
                                        size: 60,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

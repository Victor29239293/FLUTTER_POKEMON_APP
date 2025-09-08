import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_app/presentation/screens/detail_screen.dart';
import 'package:flutter_pokemon_app/presentation/widgets/item_card.dart';
import 'package:flutter_pokemon_app/utils/pokemon_skeleton.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PokemonMasonry extends StatefulWidget {
  final List<Pokemon> pokemones;
  final bool isLoading;
  final VoidCallback? loadNextPage;

  const PokemonMasonry({
    super.key,
    required this.pokemones,
    this.loadNextPage,
    required this.isLoading,
  });

  @override
  State<PokemonMasonry> createState() => _PokemonMasonryState();
}

class _PokemonMasonryState extends State<PokemonMasonry> {
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
            return const ItemCardSkeleton();
          }
          return ItemCard(
            pokemon: widget.pokemones[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(pokemon: widget.pokemones[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/config/constants/constants.dart';

import 'package:flutter_pokemon_app/presentation/widgets/pokemon_masonry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final pokemons = await ref
        .read(pokemonProvider.notifier)
        .fetchPokemonsMethod();
    isLoading = false;
    if (pokemons.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pokemons = ref.watch(pokemonProvider);
    final isLoadings = ref.watch(pokemonProvider.notifier).isLoading;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.catching_pokemon_rounded,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40,
          ),
          onPressed: () {},
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Pokedex',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          inputSearch(),
          const SizedBox(height: kDefaultPaddin / 2),
          Expanded(
            child: PokemonMasonry(
              pokemones: pokemons,
              isLoading: isLoadings,
              loadNextPage: loadNextPage,
            ),
          ),
        ],
      ),
    );
  }

  Padding inputSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(24),
        child: TextField(
          onChanged: (value) {
            ref.read(pokemonProvider.notifier).searchPokemonsMethod(value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            hintText: "Buscar Pokémon...",
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.redAccent,
              size: 28,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          style: GoogleFonts.poppins(color: Colors.black87, fontSize: 16),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

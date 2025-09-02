import 'package:flutter/material.dart';

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
    final isLoading = ref.watch(pokemonProvider.notifier).isLoading;
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
            icon: const Icon(Icons.catching_pokemon_rounded,
                color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: PokemonMasonry(
        pokemones: pokemons,
        loadNextPage: loadNextPage,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class _CategoriasCustom extends StatelessWidget {
//   const _CategoriasCustom();

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: 200,
//               child: Center(
//                 child: PopupMenuButton<String>(
//                   color: Color(0xf0333333),
//                   onSelected: (value) {
//                     // Aquí puedes manejar la selección de la categoría
//                   },
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       value: 'todos',
//                       child: Text(
//                         'Todos los tipos',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'fuego',
//                       child: Text(
//                         'Fuego',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'agua',
//                       child: Text(
//                         'Agua',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'planta',
//                       child: Text(
//                         'Planta',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     // Agrega más categorías según tu necesidad
//                   ],
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xf0333333),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Todos los tipos',
//                           style: GoogleFonts.poppins(color: Colors.white),
//                         ),
//                         SizedBox(width: 10),
//                         Icon(
//                           Icons.keyboard_arrow_down_rounded,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 15),
//             SizedBox(
//               width: 150,
//               child: Center(
//                 child: PopupMenuButton<String>(
//                   color: Color(0xf0333333),
//                   onSelected: (value) {
//                     // Aquí puedes manejar la selección del orden
//                   },
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       value: 'az',
//                       child: Text(
//                         'A-Z',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'za',
//                       child: Text(
//                         'Z-A',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 'num',
//                       child: Text(
//                         'Por número',
//                         style: GoogleFonts.poppins(color: Colors.white),
//                       ),
//                     ),
//                     // Agrega más opciones de orden si lo deseas
//                   ],
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xf0333333),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'A-z',
//                           style: GoogleFonts.poppins(color: Colors.white),
//                         ),
//                         SizedBox(width: 10),
//                         Icon(
//                           Icons.keyboard_arrow_down_rounded,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomSliverAppbar extends StatelessWidget {
//   const CustomSliverAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       floating: true,
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       elevation: 0,
//       flexibleSpace: FlexibleSpaceBar(
//         titlePadding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//         title: SizedBox(
//           width: double.infinity,
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: "Procurar Pokemon...",
//               hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: Icon(
//                 Icons.search_rounded,
//                 color: Colors.grey.shade600,
//                 size: 25,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
//               ),
//             ),
//             style: TextStyle(color: Colors.grey.shade600),
//           ),
//         ),
//       ),
//     );
//   }
// }

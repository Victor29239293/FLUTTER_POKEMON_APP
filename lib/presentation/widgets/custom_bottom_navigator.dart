import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigator extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavigator({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 0, 0, 0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: SalomonBottomBar(
          backgroundColor: Colors.transparent,
          currentIndex: widget.currentIndex,
          selectedItemColor: const Color(0xff6200ee),
          unselectedItemColor: const Color(0xff757575),
          onTap: (index) {
            onItemTapped(context, index);
          },
          itemPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          items: _navBarItems,
        ),
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.catching_pokemon, size: 28),
    title: const Text("Pokémon", style: TextStyle(fontWeight: FontWeight.bold)),
    selectedColor: Color(0xFFff5959),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.auto_awesome, size: 26),
    title: const Text(
      "Explorar",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    selectedColor: Color(0xFF43CEA2),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite, size: 26),
    title: const Text(
      "Favoritos",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    selectedColor: Color(0xFFf857a6),
  ),
  // SalomonBottomBarItem(
  //   icon: const Icon(Icons.person, size: 26),
  //   title: const Text("Perfil", style: TextStyle(fontWeight: FontWeight.bold)),
  //   selectedColor: Color(0xFF185A9D),
  // ),
];

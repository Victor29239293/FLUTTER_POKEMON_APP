import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';


// import '../../config/config.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    Color getTypeColor(String type) {
      switch (type.toLowerCase()) {
        case 'grass':
          return const Color(0xFF4CAF50);
        case 'fire':
          return const Color(0xFFFFA756);
        case 'water':
          return const Color(0xFF58ABF6);
        case 'bug':
          return const Color(0xFF8BD674);
        case 'flying':
          return const Color(0xFF83A2E3);
        case 'poison':
          return const Color(0xFF9F6E97);
        case 'electric':
          return const Color(0xFFF2CB55);
        case 'ground':
          return const Color(0xFFF78551);
        case 'fairy':
          return const Color(0xFFEB89EB);
        case 'fighting':
          return const Color(0xFFEB4971);
        case 'psychic':
          return const Color(0xFFFF6568);
        case 'rock':
          return const Color(0xFFD4C294);
        case 'ghost':
          return const Color(0xFF8571BE);
        case 'ice':
          return const Color(0xFF91D8DF);
        case 'dragon':
          return const Color(0xFF7383B9);
        case 'dark':
          return const Color(0xFF6F6E78);
        case 'steel':
          return const Color(0xFF4C91B2);
        default:
          return const Color(0xFF4CAF50);
      }
    }

    IconData getTypeIcon(String type) {
      switch (type.toLowerCase()) {
        case 'fire':
          return Icons.local_fire_department;
        case 'water':
          return Icons.water_drop;
        case 'grass':
          return Icons.eco;
        case 'electric':
          return Icons.flash_on;
        case 'bug':
          return Icons.bug_report;
        case 'flying':
          return Icons.air;
        case 'poison':
          return Icons.science;
        case 'ground':
          return Icons.landscape;
        case 'fairy':
          return Icons.auto_awesome;
        case 'fighting':
          return Icons.sports_mma;
        case 'psychic':
          return Icons.visibility;
        case 'rock':
          return Icons.terrain;
        case 'ghost':
          return Icons.nightlight_round;
        case 'ice':
          return Icons.ac_unit;
        case 'dragon':
          return Icons.whatshot;
        case 'dark':
          return Icons.dark_mode;
        case 'steel':
          return Icons.build;
        default:
          return Icons.circle;
      }
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: 12,
                children: pokemon.types.map((typeInfo) {
                  final typeName = typeInfo.type.name;
                  return Chip(
                    avatar: Icon(
                      getTypeIcon(typeName),
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      typeName[0].toUpperCase() + typeName.substring(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: getTypeColor(typeName),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class ColorDot extends StatelessWidget {
//   const ColorDot({super.key, required this.color, required this.isSelected});

//   final Color color;
//   final bool isSelected;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: kDefaultPaddin / 4,
//         right: kDefaultPaddin / 2,
//       ),
//       padding: const EdgeInsets.all(4),
//       height: 24,
//       width: 24,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: isSelected ? color : Colors.transparent),
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       ),
//     );
//   }
// }

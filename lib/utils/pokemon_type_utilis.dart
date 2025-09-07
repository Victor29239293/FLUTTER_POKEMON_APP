import 'package:flutter/material.dart';
IconData getTypeIcon(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return Icons.local_fire_department_outlined;
    case 'water':
      return Icons.water_drop_outlined;
    case 'grass':
      return Icons.eco_outlined;
    case 'electric':
      return Icons.flash_on_outlined;
    case 'bug':
      return Icons.bug_report_outlined;
    case 'flying':
      return Icons.air_outlined;
    case 'poison':
      return Icons.science_outlined;
    case 'ground':
      return Icons.landscape_outlined;
    case 'fairy':
      return Icons.auto_awesome_outlined;
    case 'fighting':
      return Icons.sports_mma_outlined;
    case 'psychic':
      return Icons.visibility_outlined;
    case 'rock':
      return Icons.terrain_outlined;
    case 'ghost':
      return Icons.nightlight_round_outlined;
    case 'ice':
      return Icons.ac_unit_outlined;
    case 'dragon':
      return Icons.whatshot_outlined;
    case 'dark':
      return Icons.dark_mode_outlined;
    case 'steel':
      return Icons.build_outlined;
    default:
      return Icons.circle_outlined;
  }
}


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
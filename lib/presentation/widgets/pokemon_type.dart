import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_app/utils/pokemon_type_utilis.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
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

import 'package:flutter/material.dart';

class PokeballLoader extends StatelessWidget {
  const PokeballLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://i.pinimg.com/originals/a7/a8/d0/a7a8d06c754cfbbbc37e64cb118c513c.gif',
        width: 200,
        height: 200,
      ),
    );
  }
}

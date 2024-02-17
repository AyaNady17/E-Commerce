import 'package:flutter/material.dart';

class FavCircularButton extends StatefulWidget {
  FavCircularButton({super.key});

  @override
  State<FavCircularButton> createState() => _FavCircularButtonState();
}

class _FavCircularButtonState extends State<FavCircularButton> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 50,
      width: 50,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: IconButton(
        padding: const EdgeInsets.all(3),
        onPressed: () {
          setState(() {
            isFav = !isFav;
          });
        },
        icon: Icon(
          isFav ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          color: isFav ? Colors.red : Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}

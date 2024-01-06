import 'package:flutter/material.dart';

class HomeCoverPhoto extends StatelessWidget {
  const HomeCoverPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          'assets/images/cover.jpg',
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Street Clothes',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}

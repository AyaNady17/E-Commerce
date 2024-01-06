import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon, required this.color});
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 232, 228, 228))),
      height: 65,
      width: 75,
      child: Icon(
        icon,
        size: 38,
        color: color,
      ),
    );
  }
}

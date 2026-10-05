import 'package:flutter/material.dart';

class JuryHeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JuryHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D0E1E),
      elevation: 0,
      title: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'X', style: TextStyle(color: Color(0xFF8A2BE2))),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 16,
            width: 1,
            color: Colors.white24,
          ),
          const SizedBox(width: 16),
          const Text(
            'Membre de jury',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
            color: Color(0xFF1B1B36),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Colors.white70, size: 20),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
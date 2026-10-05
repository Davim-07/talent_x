import 'package:flutter/material.dart';

class AdminHeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String subtitle;

  const AdminHeaderAppBar({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF090A16),
      elevation: 0,
      title: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'X ', style: TextStyle(color: Color(0xFFD91484))),
                TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'X', style: TextStyle(color: Color(0xFF8A2BE2))),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(height: 18, width: 1, color: Colors.white24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Espace Administrateur',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white54, fontSize: 10),
              ),
            ],
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
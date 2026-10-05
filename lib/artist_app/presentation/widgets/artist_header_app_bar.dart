import 'package:flutter/material.dart';

class ArtistHeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;

  const ArtistHeaderAppBar({super.key, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF12122A),
      elevation: 0,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: () => Navigator.maybePop(context),
            )
          : null,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)],
            ).createShader(bounds),
            // child: const Icon(Icons.bolt, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 6),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'X', style: TextStyle(color: Color(0xFF8A2BE2))),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
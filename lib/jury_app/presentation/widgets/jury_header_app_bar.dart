import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/auth_app/presentation/controllers/auth_controller.dart';

class JuryHeaderAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const JuryHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            'Espace Jury',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.pinkAccent, size: 20),
          tooltip: 'Déconnexion',
          onPressed: () {
            ref.read(authControllerProvider.notifier).logout(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
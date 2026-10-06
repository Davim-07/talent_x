import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/auth_app/presentation/controllers/auth_controller.dart';

class AdminHeaderAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String subtitle;

  const AdminHeaderAppBar({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
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
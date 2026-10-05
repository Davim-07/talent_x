import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class RoleSelectorCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleSelectorCard({
    super.key,
    required this.title,
    required this.icon,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5B21B6) : const Color(0xFF131429),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFA855F7) : Colors.white10,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFA855F7).withValues(alpha: 0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.white38,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
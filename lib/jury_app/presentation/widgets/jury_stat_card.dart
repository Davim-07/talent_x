import 'package:flutter/material.dart';

class JuryStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool isActive;

  const JuryStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF38236B).withValues(alpha: 0.6) : const Color(0xFF15162D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? const Color(0xFF8A2BE2) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isActive ? Colors.white : Colors.white70,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.white38,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
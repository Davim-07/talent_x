import 'package:flutter/material.dart';

class CompetitionItemTile extends StatelessWidget {
  final String title;
  final String dates;
  final String location;
  final bool isActive;

  const CompetitionItemTile({
    super.key,
    required this.title,
    required this.dates,
    required this.location,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF131429),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 50,
              height: 50,
              color: const Color(0xFF232448),
              child: const Icon(Icons.image, color: Colors.white38),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.white38, size: 12),
                    const SizedBox(width: 4),
                    Text(dates, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                    const SizedBox(width: 8),
                    const Icon(Icons.location_on, color: Colors.white38, size: 12),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.teal.withValues(alpha: 0.2)
                  : const Color(0xFF4A148C).withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified,
                  color: isActive ? Colors.tealAccent : Colors.purpleAccent,
                  size: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  isActive ? 'En cours' : 'Terminée',
                  style: TextStyle(
                    color: isActive ? Colors.tealAccent : Colors.purpleAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white38, size: 18),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
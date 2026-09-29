import 'package:flutter/material.dart';

class EventInfoCard extends StatelessWidget {
  final String date;
  final String prize;
  final String description;

  const EventInfoCard({
    Super.key,
    required this.date,
    required this.prize,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Event Info",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Color(0xFF8A2BE2), size: 18),
              const SizedBox(width: 10),
              Text(date, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 18),
              const SizedBox(width: 10),
              Text("Grand Prix : $prize", style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(color: Colors.grey[400], fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }
}
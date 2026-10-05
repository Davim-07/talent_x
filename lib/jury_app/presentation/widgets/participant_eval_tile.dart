import 'package:flutter/material.dart';
import '../controllers/jury_dashboard_controller.dart';

class ParticipantEvalTile extends StatelessWidget {
  final JuryParticipant participant;
  final VoidCallback onEvalPressed;

  const ParticipantEvalTile({
    super.key,
    required this.participant,
    required this.onEvalPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF15162D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          // Index du candidat
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF1F2041),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${participant.indexNumber}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Avatar du candidat
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 50,
              height: 50,
              color: const Color(0xFF2A2B4D),
              child: const Icon(Icons.person, color: Colors.white54, size: 30),
            ),
          ),
          const SizedBox(width: 12),

          // Infos cibles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      participant.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 6),
                    _buildCategoryBadge(participant.category),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  participant.description,
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
                const SizedBox(height: 2),
                Text(
                  '${participant.candidateNumber}  |  ${participant.age} ans',
                  style: const TextStyle(color: Colors.white38, fontSize: 10),
                ),
              ],
            ),
          ),

          // Boutons d'évaluation
          Column(
            children: [
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1B38),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    Icon(
                      participant.isEvaluated ? Icons.star : Icons.star_border,
                      color: Colors.white54,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      participant.isEvaluated
                          ? '${participant.score}'
                          : 'Non évalué',
                      style: const TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: onEvalPressed,
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)],
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Évaluer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(String category) {
    Color badgeColor;
    IconData iconData;

    switch (category.toLowerCase()) {
      case 'chant':
        badgeColor = const Color(0xFF6A1B9A);
        iconData = Icons.music_note;
        break;
      case 'danse':
        badgeColor = const Color(0xFFD84315);
        iconData = Icons.directions_run;
        break;
      case 'humour':
        badgeColor = const Color(0xFF880E4F);
        iconData = Icons.theater_comedy;
        break;
      default:
        badgeColor = const Color(0xFF00695C);
        iconData = Icons.music_off;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: Colors.white, size: 10),
          const SizedBox(width: 3),
          Text(
            category,
            style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
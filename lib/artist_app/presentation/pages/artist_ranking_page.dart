import 'package:flutter/material.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistRankingPage extends StatelessWidget {
  const ArtistRankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      appBar: const ArtistHeaderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.workspace_premium, color: Color(0xFF8A2BE2), size: 32),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Classement général', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Les meilleurs talents de la compétition', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Catégories
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTab('Global', isSelected: true),
                  _buildTab('Chant'),
                  _buildTab('Danse'),
                  _buildTab('Dessin'),
                  _buildTab('HipHop'),
                  _buildTab('Autre'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Ranking List
            Expanded(
              child: ListView(
                children: [
                  _buildRankItem(1, 'Achille M.', 'Danse', 12450, Colors.amber),
                  _buildRankItem(2, 'Davy M.', 'HipHop', 9870, Colors.grey.shade400),
                  _buildRankItem(3, 'Elana S.', 'Chant', 8320, const Color(0xFFFF5722)),
                  _buildRankItem(4, 'Joy B.', 'Dessin', 6210, null),
                  _buildRankItem(5, 'Ange L.', 'Danse', 4980, null),
                  _buildRankItem(6, 'Nina I.', 'Chant', 4975, null),
                  _buildRankItem(7, 'Gogo', 'Danse', 4970, null),
                  _buildRankItem(8, 'Raissa', 'Chant', 4965, null),
                  _buildRankItem(9, 'Ciella A.', 'Danse', 4960, null),
                  _buildRankItem(10, 'MAAC', 'Danse', 4955, null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF8A2BE2) : const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildRankItem(int rank, String name, String cat, int votes, Color? badgeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: badgeColor ?? Colors.grey.shade800,
            child: Text('$rank', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(radius: 20, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(cat, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.pink, size: 12),
                    const SizedBox(width: 4),
                    Text('$votes', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
          if (badgeColor != null)
            Icon(Icons.emoji_events, color: badgeColor, size: 24),
        ],
      ),
    );
  }
}
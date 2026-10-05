import 'package:flutter/material.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistVotePage extends StatelessWidget {
  const ArtistVotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      appBar: const ArtistHeaderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Timer Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vote en cours', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('Soutenez votre talent préféré !', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8A2BE2).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.timer_outlined, color: Color(0xFF8A2BE2), size: 14),
                        SizedBox(width: 4),
                        Text('2j 14h 32m', style: TextStyle(color: Color(0xFF8A2BE2), fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip('Tous', isSelected: true),
                  _buildFilterChip('Chant'),
                  _buildFilterChip('Danse'),
                  _buildFilterChip('Dessin'),
                  _buildFilterChip('HipHop'),
                  _buildFilterChip('Autre'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Vote List
            Expanded(
              child: ListView(
                children: [
                  _buildVoteItem('#001', 'Achille M.', 'Danse', 12450, 0.8),
                  _buildVoteItem('#002', 'Davy M.', 'HipHop', 9870, 0.65),
                  _buildVoteItem('#003', 'Joy B.', 'Dessin', 8320, 0.5),
                  _buildVoteItem('#004', 'Elana S.', 'Chant', 6210, 0.4),
                  _buildVoteItem('#005', 'Le genie', 'Danse', 6207, 0.4),
                  _buildVoteItem('#006', 'MAAC', 'Danse', 7203, 0.3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
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

  Widget _buildVoteItem(String code, String name, String category, int votes, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 26, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$code  $name', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.pinkAccent, size: 14),
                        const SizedBox(width: 4),
                        Text('$votes', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Text(category, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFF12122A),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8A2BE2)),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A2BE2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: const Text('Voter', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
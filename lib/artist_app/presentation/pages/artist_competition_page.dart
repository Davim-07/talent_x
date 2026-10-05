import 'package:flutter/material.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistCompetitionPage extends StatelessWidget {
  const ArtistCompetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      appBar: const ArtistHeaderAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banners Event Detail
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8A2BE2), Color(0xFF12122A)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Battle de Danse 2026',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text('Danse • Hip-hop, Dessin, Chant', style: TextStyle(color: Colors.white70, fontSize: 13)),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.calendar_month, color: Colors.white70, size: 16),
                          SizedBox(width: 4),
                          Text('12 - 15 Août 2026', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          SizedBox(width: 16),
                          Icon(Icons.location_on, color: Colors.white70, size: 16),
                          SizedBox(width: 4),
                          Text('Buja Arena', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF8A2BE2)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.crop_free, color: Colors.greenAccent, size: 14),
                        SizedBox(width: 4),
                        Text('En cours', style: TextStyle(color: Colors.white, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Statistiques Compétition
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('100 participants', 'max'),
                  _buildStat('Jury :', '5 membres'),
                  _buildStat('Prix :', '5 000 000 Fbu', highlight: true),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // À propos
            const Text('À propos de la compétition', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'La Battle de Danse 2026 réunit les meilleurs talents du pays pour une compétition unique. Trois jours de show, de passion et de performance. Qui sera le prochain champion ?',
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Participants Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Participants', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('Voir tous', style: TextStyle(color: Color(0xFF8A2BE2)))),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildParticipantCard('#001', 'Achille M.', 'Danse'),
                _buildParticipantCard('#002', 'Davy M.', 'HipHop'),
                _buildParticipantCard('#003', 'Joy B.', 'Dessin'),
                _buildParticipantCard('#004', 'Elana S.', 'Chant'),
                _buildParticipantCard('#005', 'MAAC', 'Danse'),
                _buildParticipantCard('#006', 'Le genie', 'Danse'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, {bool highlight = false}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: highlight ? const Color(0xFFFF5722) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildParticipantCard(String code, String name, String style) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 24, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(height: 6),
          Text(code, style: const TextStyle(color: Color(0xFF8A2BE2), fontSize: 10, fontWeight: FontWeight.bold)),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
          Text(style, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          const SizedBox(height: 6),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A2BE2),
              minimumSize: const Size(double.infinity, 35),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: const Text('Voir profil', style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
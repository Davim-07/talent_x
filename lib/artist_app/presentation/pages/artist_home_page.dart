import 'package:flutter/material.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistHomePage extends StatelessWidget {
  const ArtistHomePage({super.key});

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
            // Banner Principal (Battle de Danse 2026)
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF8A2BE2), Color(0xFF12122A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Battle de Danse 2026',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Soutenez les meilleurs talents dans cette grande finale !',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Artistes à la Une
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Artistes à la Une',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Voir tout', style: TextStyle(color: Color(0xFF8A2BE2))),
                ),
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildArtistCard('Achille M.', 'Danse'),
                  _buildArtistCard('Davy M.', 'HipHop'),
                  _buildArtistCard('Joy B.', 'Dessin'),
                  _buildArtistCard('Elana S.', 'Chant'),
                  _buildArtistCard('Le genie', 'Danse'),
                  _buildArtistCard('MAAC', 'Danse'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Compétitions du Moment
            const Text(
              'Compétitions du Moment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildCompMiniCard('Vokal Star:\nAuditions')),
                const SizedBox(width: 12),
                Expanded(child: _buildCompMiniCard('Compétitions\ndu Moment')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(String name, String cat) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)]),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          Text(cat, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A2BE2),
              minimumSize: const Size(double.infinity, 30),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: const Text('Voir', style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildCompMiniCard(String title) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF8A2BE2).withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
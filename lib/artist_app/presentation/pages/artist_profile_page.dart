import 'package:flutter/material.dart';

class ArtistProfilePage extends StatelessWidget {
  const ArtistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Profil',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Photo & Cercle Lumineux Neon
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)]),
                ),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFF1E1E3F),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Achille M.', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('Danseur et performeur', style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 20),

              // Stats Row
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E3F),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildUserStat('12,5K', 'Abonnés'),
                    _buildUserStat('48K', 'Votes'),
                    _buildUserStat('12', 'Prestations'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Biographie
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Biographie', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E3F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Aisha B. est une chanteuse et performeuse passionnée. Elle partage sa musique et ses prestations sur scène avec sa communauté...',
                  style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                ),
              ),
              const SizedBox(height: 20),

              // Mes prestations
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Mes prestations', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildPrestationCard('Vokal Star', const Color(0xFF8A2BE2))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildPrestationCard('Audition Finale', const Color(0xFFFF5722))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ],
    );
  }

  Widget _buildPrestationCard(String title, Color color) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
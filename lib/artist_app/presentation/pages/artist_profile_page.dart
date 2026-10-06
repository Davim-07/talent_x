import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/auth_app/presentation/controllers/auth_controller.dart';
import 'package:talent_x/core/providers/artist_provider.dart';
import 'package:talent_x/core/providers/vote_provider.dart';

class ArtistProfilePage extends ConsumerWidget {
  const ArtistProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserProfileProvider);
    final artistsAsync = ref.watch(allArtistsStreamProvider);
    final votesAsync = ref.watch(allVotesStreamProvider);

    // Nom et catégorie
    final name = userProfile?.fullName ?? 'Achille M.';
    final category = userProfile?.artCategory ?? 'Danse';

    // Compte des votes de l'utilisateur
    final totalVotes = votesAsync.maybeWhen(
      data: (votes) {
        final currentArtistId = userProfile?.uid ?? 'art_1';
        return votes.where((v) => v.artistId == currentArtistId).length * 2;
      },
      orElse: () => 48,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header avec Titre et Bouton Déconnexion
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.pinkAccent),
                    tooltip: 'Se déconnecter',
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .logout(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Photo & Cercle Lumineux Neon
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFF1E1E3F),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$category • TalentX',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 20),

              // Stats Row (Dynamique)
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
                    _buildUserStat('$totalVotes TX', 'Points'),
                    _buildUserStat('3', 'Prestations'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Biographie
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Biographie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E3F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$name est un talent passionné dans la catégorie $category. '
                  'Inscrit sur TalentX pour concourir dans les grandes compétitions et partager son art avec le public et le jury.',
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 13, height: 1.4),
                ),
              ),
              const SizedBox(height: 20),

              // Mes prestations
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mes prestations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildPrestationCard(
                      'Battle 2026',
                      const Color(0xFF8A2BE2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildPrestationCard(
                      'Audition Finale',
                      const Color(0xFFFF5722),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Bouton déconnexion explicite
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white70,
                  side: const BorderSide(color: Colors.white24),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.exit_to_app, size: 18),
                label: const Text('Déconnexion'),
                onPressed: () {
                  ref.read(authControllerProvider.notifier).logout(context);
                },
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
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
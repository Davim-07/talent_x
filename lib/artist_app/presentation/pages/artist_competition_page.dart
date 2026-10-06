import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/providers/artist_provider.dart';
import 'package:talent_x/core/providers/competition_provider.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistCompetitionPage extends ConsumerWidget {
  const ArtistCompetitionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final competitionsAsync = ref.watch(allCompetitionsStreamProvider);
    final artistsAsync = ref.watch(allArtistsStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      appBar: const ArtistHeaderAppBar(),
      body: competitionsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFF8A2BE2)),
        ),
        error: (error, stack) => _buildErrorState(error),
        data: (competitions) {
          final competition =
              competitions.isNotEmpty ? competitions.first : null;
          final participants = artistsAsync.maybeWhen(
            data: (artists) => artists,
            orElse: () => <Artist>[],
          );

          if (competition == null) {
            return _buildEmptyState();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            competition.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${competition.category} • ${competition.description}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.calendar_month,
                                  color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                _formatDeadline(competition.deadline),
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.location_on,
                                  color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              const Text(
                                'Buja Arena',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF8A2BE2)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.crop_free,
                                color: Colors.greenAccent, size: 14),
                            SizedBox(width: 4),
                            Text('En cours',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E3F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat('Participants', '${participants.length}'),
                      _buildStat('Jury', '5 membres'),
                      _buildStat('Prix', '5 000 000 Fbu', highlight: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'À propos de la compétition',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  competition.description,
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Participants',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Voir tous',
                          style: TextStyle(color: Color(0xFF8A2BE2))),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (participants.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Aucun participant pour cette compétition.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: participants
                        .map((artist) => _buildParticipantCard(artist))
                        .toList(),
                  ),
              ],
            ),
          );
        },
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

  Widget _buildParticipantCard(Artist artist) {
    final code = artist.id.length > 6
        ? artist.id.substring(0, 6).toUpperCase()
        : artist.id.toUpperCase();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey,
            backgroundImage: artist.imageUrl.isNotEmpty
                ? NetworkImage(artist.imageUrl)
                : null,
            child: artist.imageUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 6),
          Text(
            '#$code',
            style: const TextStyle(
              color: Color(0xFF8A2BE2),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            artist.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            artist.category,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A2BE2),
              minimumSize: const Size(double.infinity, 35),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: const Text('Voir profil',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Aucune compétition disponible pour le moment.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Erreur de chargement Firebase :\n$error',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }

  String _formatDeadline(String rawDate) {
    if (rawDate.trim().isEmpty) {
      return 'Date à confirmer';
    }

    final parsed = DateTime.tryParse(rawDate);
    if (parsed == null) {
      return rawDate;
    }

    return '${parsed.day.toString().padLeft(2, '0')} - ${parsed.month.toString().padLeft(2, '0')} - ${parsed.year}';
  }
}

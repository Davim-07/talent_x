import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/providers/artist_provider.dart';
import 'package:talent_x/core/providers/competition_provider.dart';
import 'package:talent_x/core/providers/vote_provider.dart';
import '../widgets/artist_header_app_bar.dart';

class ArtistVotePage extends ConsumerStatefulWidget {
  const ArtistVotePage({super.key});

  @override
  ConsumerState<ArtistVotePage> createState() => _ArtistVotePageState();
}

class _ArtistVotePageState extends ConsumerState<ArtistVotePage> {
  String _selectedCategory = 'Tous';
  String _selectedCompetitionId = 'comp_battle_2026';
  final List<String> _categories = ['Tous', 'Chant', 'Danse', 'Dessin', 'HipHop', 'Autre'];

  @override
  Widget build(BuildContext context) {
    final artistsAsync = ref.watch(allArtistsStreamProvider);
    final competitionsAsync = ref.watch(activeCompetitionsStreamProvider);
    final votesAsync = ref.watch(allVotesStreamProvider);
    final voteRepo = ref.read(voteRepositoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      appBar: const ArtistHeaderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // En-tête Vote en cours + sélecteur de compétition
            competitionsAsync.when(
              data: (competitions) {
                if (competitions.isNotEmpty && !competitions.any((c) => c.id == _selectedCompetitionId)) {
                  _selectedCompetitionId = competitions.first.id;
                }
                return Container(
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
                      if (competitions.isNotEmpty)
                        DropdownButton<String>(
                          value: _selectedCompetitionId,
                          dropdownColor: const Color(0xFF1E1E3F),
                          style: const TextStyle(color: Colors.white, fontSize: 11),
                          underline: const SizedBox(),
                          onChanged: (val) {
                            if (val != null) setState(() => _selectedCompetitionId = val);
                          },
                          items: competitions
                              .map((c) => DropdownMenuItem(value: c.id, child: Text(c.title, overflow: TextOverflow.ellipsis)))
                              .toList(),
                        ),
                    ],
                  ),
                );
              },
              loading: () => const SizedBox(height: 70, child: Center(child: CircularProgressIndicator(strokeWidth: 2))),
              error: (_, __) => const SizedBox(),
            ),
            const SizedBox(height: 16),

            // Filter Chips catégorie
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final isSelected = _selectedCategory == cat;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedCategory = cat),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF8A2BE2) : const Color(0xFF1E1E3F),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(cat, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Liste des artistes à voter
            Expanded(
              child: artistsAsync.when(
                data: (artists) {
                  final votes = votesAsync.valueOrNull ?? [];

                  // Filtrer par catégorie
                  final filtered = _selectedCategory == 'Tous'
                      ? artists
                      : artists.where((a) => a.category == _selectedCategory).toList();

                  if (filtered.isEmpty) {
                    return const Center(
                      child: Text('Aucun artiste dans cette catégorie.', style: TextStyle(color: Colors.white54)),
                    );
                  }

                  // Calculer les votes par artiste pour cette compétition
                  final votesByArtist = <String, int>{};
                  for (final v in votes) {
                    if (v.competitionId == _selectedCompetitionId) {
                      votesByArtist[v.artistId] = (votesByArtist[v.artistId] ?? 0) + 1;
                    }
                  }

                  final maxVotes = votesByArtist.values.fold(0, (a, b) => a > b ? a : b);

                  // Trier par votes décroissant
                  final sorted = List<Artist>.from(filtered)
                    ..sort((a, b) => (votesByArtist[b.id] ?? 0).compareTo(votesByArtist[a.id] ?? 0));

                  return ListView.builder(
                    itemCount: sorted.length,
                    itemBuilder: (context, index) {
                      final artist = sorted[index];
                      final artistVotes = votesByArtist[artist.id] ?? 0;
                      final progress = maxVotes > 0 ? artistVotes / maxVotes : 0.0;

                      return _ArtistVoteTile(
                        rank: index + 1,
                        artist: artist,
                        votes: artistVotes,
                        progress: progress,
                        competitionId: _selectedCompetitionId,
                        onVote: () async {
                          await voteRepo.castVote(
                            artistId: artist.id,
                            competitionId: _selectedCompetitionId,
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('✅ Vote pour ${artist.name} enregistré !'),
                                backgroundColor: const Color(0xFF8A2BE2),
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Erreur: $e', style: const TextStyle(color: Colors.red))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tile individuel d'un artiste avec vérification hasAlreadyVoted
// ---------------------------------------------------------------------------
class _ArtistVoteTile extends ConsumerWidget {
  final int rank;
  final Artist artist;
  final int votes;
  final double progress;
  final String competitionId;
  final VoidCallback onVote;

  const _ArtistVoteTile({
    required this.rank,
    required this.artist,
    required this.votes,
    required this.progress,
    required this.competitionId,
    required this.onVote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasVotedAsync = ref.watch(
      hasAlreadyVotedProvider(VoteCheckParams(artistId: artist.id, competitionId: competitionId)),
    );

    final hasVoted = hasVotedAsync.valueOrNull ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        borderRadius: BorderRadius.circular(16),
        border: hasVoted
            ? Border.all(color: const Color(0xFF8A2BE2).withValues(alpha: 0.5), width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFF8A2BE2).withValues(alpha: 0.3),
            child: Text(
              '#$rank',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(artist.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.pinkAccent, size: 14),
                        const SizedBox(width: 4),
                        Text('$votes', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Text(artist.category, style: const TextStyle(color: Colors.grey, fontSize: 11)),
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
          hasVoted
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8A2BE2).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF8A2BE2)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check, color: Color(0xFF8A2BE2), size: 14),
                      SizedBox(width: 4),
                      Text('Voté', style: TextStyle(color: Color(0xFF8A2BE2), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8A2BE2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                  onPressed: onVote,
                  child: const Text('Voter', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
        ],
      ),
    );
  }
}
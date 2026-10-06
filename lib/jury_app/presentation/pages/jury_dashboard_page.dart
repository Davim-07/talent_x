import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/entities/jury_rank.dart';
import 'package:talent_x/core/providers/artist_provider.dart';
import 'package:talent_x/core/providers/vote_provider.dart';
import '../controllers/jury_dashboard_controller.dart';
import '../widgets/jury_header_app_bar.dart';
import '../widgets/jury_stat_card.dart';
import '../widgets/participant_eval_tile.dart';

class JuryDashboardPage extends ConsumerStatefulWidget {
  const JuryDashboardPage({super.key});

  @override
  ConsumerState<JuryDashboardPage> createState() => _JuryDashboardPageState();
}

class _JuryDashboardPageState extends ConsumerState<JuryDashboardPage> {
  String _searchQuery = '';
  final String _competitionId = 'comp_battle_2026';

  @override
  Widget build(BuildContext context) {
    final artistsAsync = ref.watch(allArtistsStreamProvider);
    final juryRanksAsync =
        ref.watch(allJuryRanksStreamProvider(_competitionId));

    final ranks = juryRanksAsync.maybeWhen(
      data: (r) => r,
      orElse: () => <JuryRank>[],
    );

    // Map: artistId -> rank
    final Map<String, int> rankMap = {};
    for (var r in ranks) {
      rankMap[r.artistId] = r.rank;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0E1E),
      appBar: const JuryHeaderAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de la compétition (TalentX 2026)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF321A63), Color(0xFF15102A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                    color: const Color(0xFF8A2BE2).withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8A2BE2).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                            radius: 3, backgroundColor: Colors.pinkAccent),
                        SizedBox(width: 6),
                        Text(
                          'Évaluation en direct',
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: 'Battle ',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'TalentX ',
                            style: TextStyle(color: Color(0xFF8A2BE2))),
                        TextSpan(
                            text: '2026',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Révélons les talents de demain',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  _buildEventDetail(
                      Icons.calendar_month_outlined, '12 - 15 Août 2026'),
                  _buildEventDetail(
                      Icons.location_on_outlined, 'Bujumbura Arena'),
                  _buildEventDetail(Icons.people_outline,
                      'Catégories : Chant, Danse, Dessin, HipHop'),
                  _buildEventDetail(Icons.description_outlined,
                      'Phase actuelle : Auditions - Demi-finale'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Cartes Statistiques (Branchées aux données)
            artistsAsync.when(
              data: (artists) {
                final total = artists.length;
                final evaluated = ranks.length;
                final pending = (total - evaluated).clamp(0, total);

                return Row(
                  children: [
                    Expanded(
                      child: JuryStatCard(
                        icon: Icons.people_alt_outlined,
                        value: '$total',
                        label: 'Participants',
                        isActive: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: JuryStatCard(
                        icon: Icons.check_circle_outline,
                        value: '$evaluated',
                        label: 'Évalués',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: JuryStatCard(
                        icon: Icons.access_time,
                        value: '$pending',
                        label: 'En attente',
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: JuryStatCard(
                        icon: Icons.emoji_events_outlined,
                        value: 'Top 10',
                        label: 'Pour la finale',
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(
                  child: CircularProgressIndicator(color: Color(0xFF8A2BE2))),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 24),

            // Header Liste & Barre de Recherche
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Liste des participants',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val.toLowerCase();
                        });
                      },
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      decoration: InputDecoration(
                        hintText: 'Rechercher un participant...',
                        hintStyle: const TextStyle(
                            color: Colors.white38, fontSize: 11),
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.white38, size: 18),
                        filled: true,
                        fillColor: const Color(0xFF15162D),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Liste Dynamique des Candidats
            artistsAsync.when(
              data: (artists) {
                final filtered = artists.where((a) {
                  return a.name.toLowerCase().contains(_searchQuery) ||
                      a.category.toLowerCase().contains(_searchQuery);
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                        'Aucun participant trouvé.',
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final artist = filtered[index];
                    final hasRank = rankMap.containsKey(artist.id);
                    final currentRank = rankMap[artist.id];

                    final participant = JuryParticipant(
                      id: artist.id,
                      indexNumber: index + 1,
                      name: artist.name,
                      category: artist.category,
                      description: 'Candidat TalentX',
                      candidateNumber:
                          'N° ${(index + 1).toString().padLeft(3, '0')}',
                      age: 20 + (index % 5),
                      isEvaluated: hasRank,
                      score: hasRank ? currentRank?.toDouble() : null,
                    );

                    return ParticipantEvalTile(
                      participant: participant,
                      onEvalPressed: () {
                        _showEvaluationDialog(artist, currentRank);
                      },
                    );
                  },
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child:
                      CircularProgressIndicator(color: Color(0xFF8A2BE2)),
                ),
              ),
              error: (err, _) => Center(
                child: Text('Erreur: $err',
                    style: const TextStyle(color: Colors.redAccent)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEvaluationDialog(Artist artist, int? currentRank) {
    int selectedRank = currentRank ?? 1;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E3F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Évaluer : ${artist.name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white54),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Text(
                    'Catégorie : ${artist.category}',
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Attribuer un Rang / Note (1 = Meilleur) :',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 12),

                  // Sélecteur de rang de 1 à 10
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(10, (index) {
                      final rank = index + 1;
                      final isSelected = rank == selectedRank;
                      return ChoiceChip(
                        label: Text('Rang $rank'),
                        selected: isSelected,
                        selectedColor: const Color(0xFF8A2BE2),
                        backgroundColor: const Color(0xFF131429),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setModalState(() {
                              selectedRank = rank;
                            });
                          }
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

                  // Bouton Enregistrer
                  Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        await ref.read(voteRepositoryProvider).setMyRank(
                              artistId: artist.id,
                              competitionId: _competitionId,
                              rank: selectedRank,
                            );

                        if (mounted) {
                          ScaffoldMessenger.of(this.context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFF8A2BE2),
                              content: Text(
                                'Évaluation enregistrée : ${artist.name} classé Rang $selectedRank !',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Valider l\'évaluation',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildEventDetail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white54, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
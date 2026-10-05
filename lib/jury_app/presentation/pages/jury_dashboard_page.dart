import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/jury_dashboard_controller.dart';
import '../widgets/jury_header_app_bar.dart';
import '../widgets/jury_stat_card.dart';
import '../widgets/participant_eval_tile.dart';

class JuryDashboardPage extends ConsumerWidget {
  const JuryDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(juryDashboardControllerProvider);
    final controller = ref.read(juryDashboardControllerProvider.notifier);

    final filteredParticipants = state.participants.where((p) {
      final query = state.searchQuery.toLowerCase();
      return p.name.toLowerCase().contains(query) ||
          p.category.toLowerCase().contains(query) ||
          p.candidateNumber.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0E1E),
      appBar: const JuryHeaderAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de la compétition (TalentX 2025)
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
                border: Border.all(color: const Color(0xFF8A2BE2).withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8A2BE2).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 3, backgroundColor: Colors.pinkAccent),
                        SizedBox(width: 6),
                        Text(
                          'Compétition en cours',
                          style: TextStyle(color: Colors.pinkAccent, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                        TextSpan(text: 'X ', style: TextStyle(color: Color(0xFF8A2BE2))),
                        TextSpan(text: '2025', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Révélons les talents de demain',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  _buildEventDetail(Icons.calendar_month_outlined, '12 - 15 Août 2025'),
                  _buildEventDetail(Icons.location_on_outlined, 'Bujumbura Arena'),
                  _buildEventDetail(Icons.people_outline, 'Catégories : Chant, Danse, Humour, Musique instrumentale'),
                  _buildEventDetail(Icons.description_outlined, 'Phase actuelle : Auditions - Demi-finale'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Cartes Statistiques
            Row(
              children: [
                Expanded(
                  child: JuryStatCard(
                    icon: Icons.people_alt_outlined,
                    value: '${state.totalParticipants}',
                    label: 'Participants',
                    isActive: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: JuryStatCard(
                    icon: Icons.check_circle_outline,
                    value: '${state.evaluatedCount}',
                    label: 'Évalués',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: JuryStatCard(
                    icon: Icons.access_time,
                    value: '${state.pendingCount}',
                    label: 'En attente',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: JuryStatCard(
                    icon: Icons.emoji_events_outlined,
                    value: 'Top ${state.topFinalists}',
                    label: 'Pour la finale',
                  ),
                ),
              ],
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
                      onChanged: controller.updateSearchQuery,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      decoration: InputDecoration(
                        hintText: 'Rechercher un participant...',
                        hintStyle: const TextStyle(color: Colors.white38, fontSize: 11),
                        prefixIcon: const Icon(Icons.search, color: Colors.white38, size: 18),
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

            // Liste des Candidats
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredParticipants.length,
              itemBuilder: (context, index) {
                final participant = filteredParticipants[index];
                return ParticipantEvalTile(
                  participant: participant,
                  onEvalPressed: () {
                    // Action pour ouvrir la fiche de notation détaillée
                  },
                );
              },
            ),
          ],
        ),
      ),
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/admin_controller.dart';
import '../widgets/admin_stat_card.dart';
import '../widgets/competition_item_tile.dart';

class AdminDashboardTab extends ConsumerWidget {
  const AdminDashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminControllerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner "Bonjour Admin"
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF220E46), Color(0xFF0F0B1E)],
              ),
              border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '👋 Bonjour Admin !',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Voici un aperçu de l\'activité sur TalentX. Tout se passe bien !',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Grille des Statistiques
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.25,
            children: [
              AdminStatCard(
                icon: Icons.emoji_events,
                value: '${state.totalCompetitions}',
                label: 'Compétitions',
                growth: '+2 ce mois',
                iconBgColor: Colors.purpleAccent,
              ),
              AdminStatCard(
                icon: Icons.people,
                value: '${state.totalParticipants}',
                label: 'Participants',
                growth: '+48 ce mois',
                iconBgColor: Colors.blueAccent,
              ),
              AdminStatCard(
                icon: Icons.assignment_turned_in,
                value: '${state.totalEvaluations}',
                label: 'Évaluations',
                growth: '+18 ce mois',
                iconBgColor: Colors.pinkAccent,
              ),
              AdminStatCard(
                icon: Icons.star,
                value: '${state.activeCompetitions}',
                label: 'En cours',
                growth: '+3 ce mois',
                iconBgColor: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Section Graphe
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131429),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.bar_chart, color: Colors.purpleAccent, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Évolution des participations',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2041),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Text('7 derniers jours', style: TextStyle(color: Colors.white70, fontSize: 10)),
                          Icon(Icons.arrow_drop_down, color: Colors.white70, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    '[ Graphique des Participations ]',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Liste des compétitions récentes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.workspace_premium, color: Colors.amber, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Compétitions récentes',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Voir toutes >', style: TextStyle(color: Colors.purpleAccent, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CompetitionItemTile(
            title: 'TalentX 2025',
            dates: '12 - 15 Août 2025',
            location: 'Bujumbura Arena',
            isActive: true,
          ),
          const CompetitionItemTile(
            title: 'Next Star',
            dates: '5 - 8 Juillet 2025',
            location: 'Centre Culturel',
          ),
          const CompetitionItemTile(
            title: 'Voix d\'Or',
            dates: '20 - 25 Juin 2025',
            location: 'Salle Polyvalente',
          ),
          const CompetitionItemTile(
            title: 'Danse & Rythme',
            dates: '10 - 14 Mai 2025',
            location: 'Stade Municipal',
          ),
        ],
      ),
    );
  }
}
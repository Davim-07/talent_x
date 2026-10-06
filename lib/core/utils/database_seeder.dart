import 'package:flutter/foundation.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/entities/big_event.dart';
import 'package:talent_x/core/domain/entities/competitition.dart';
import 'package:talent_x/core/domain/repositorires/artist_repository.dart';
import 'package:talent_x/core/domain/repositorires/big_event_repository.dart';
import 'package:talent_x/core/domain/repositorires/competition_repository.dart';
import 'package:talent_x/core/domain/repositorires/vote_repository.dart';

class DatabaseSeeder {
  static Future<void> seedIfEmpty({
    required CompetitionRepository competitionRepo,
    required ArtistRepository artistRepo,
    required BigEventRepository bigEventRepo,
    required VoteRepository voteRepo,
  }) async {
    try {
      // Vérifier si la base locale contient déjà des compétitions
      final existingComps = await competitionRepo.getActiveCompetitions().first;
      if (existingComps.isNotEmpty) {
        return; // Données déjà présentes, pas besoin de réinjecter
      }

      debugPrint('🌱 Initialisation du jeu de données de démarrage (Seeding)...');

      // 1. Grands Événements
      await bigEventRepo.saveBigEvent(
        BigEvent(
          title: 'Battle de Danse 2026',
          subtitle: 'Soutenez les meilleurs talents dans cette grande finale !',
          imageUrl: '',
        ),
      );

      // 2. Compétitions
      final competitions = [
        Competition(
          id: 'comp_battle_2026',
          title: 'Battle de Danse 2026',
          category: 'Danse',
          description:
              'La Battle de Danse 2026 réunit les meilleurs talents du pays pour une compétition unique. Trois jours de show, de passion et de performance. Qui sera le prochain champion ?',
          imageUrl: '',
          deadline: '12 - 15 Août 2026',
        ),
        Competition(
          id: 'comp_vokal_2026',
          title: 'Vokal Star: Auditions',
          category: 'Chant',
          description: 'Grand concours national de chant et interprétation vocale.',
          imageUrl: '',
          deadline: '20 - 25 Juin 2026',
        ),
        Competition(
          id: 'comp_next_star',
          title: 'Next Star',
          category: 'HipHop',
          description: 'Tremplin hip-hop et musiques urbaines.',
          imageUrl: '',
          deadline: '5 - 8 Juillet 2026',
        ),
        Competition(
          id: 'comp_voix_or',
          title: "Voix d'Or",
          category: 'Chant',
          description: 'Compétition lyrique et gospel.',
          imageUrl: '',
          deadline: '1 - 5 Septembre 2026',
        ),
      ];

      for (var comp in competitions) {
        await competitionRepo.saveCompetition(comp);
      }

      // 3. Artistes
      final artists = [
        Artist(
          id: 'art_1',
          name: 'Achille M.',
          category: 'Danse',
          imageUrl: '',
        ),
        Artist(
          id: 'art_2',
          name: 'Davy M.',
          category: 'HipHop',
          imageUrl: '',
        ),
        Artist(
          id: 'art_3',
          name: 'Joy B.',
          category: 'Dessin',
          imageUrl: '',
        ),
        Artist(
          id: 'art_4',
          name: 'Elana S.',
          category: 'Chant',
          imageUrl: '',
        ),
        Artist(
          id: 'art_5',
          name: 'MAAC',
          category: 'Danse',
          imageUrl: '',
        ),
        Artist(
          id: 'art_6',
          name: 'Le genie',
          category: 'Danse',
          imageUrl: '',
        ),
      ];

      for (var artist in artists) {
        await artistRepo.saveArtist(artist);
      }

      // 4. Votes initiaux de démonstration
      for (int i = 0; i < 25; i++) {
        await voteRepo.castVote(
          artistId: 'art_1',
          competitionId: 'comp_battle_2026',
        );
      }
      for (int i = 0; i < 18; i++) {
        await voteRepo.castVote(
          artistId: 'art_2',
          competitionId: 'comp_battle_2026',
        );
      }
      for (int i = 0; i < 12; i++) {
        await voteRepo.castVote(
          artistId: 'art_3',
          competitionId: 'comp_battle_2026',
        );
      }
      for (int i = 0; i < 8; i++) {
        await voteRepo.castVote(
          artistId: 'art_4',
          competitionId: 'comp_battle_2026',
        );
      }

      debugPrint('Données de démarrage insérées avec succès !');
    } catch (e) {
      debugPrint('Notice de démarrage (Seeding): $e');
    }
  }
}


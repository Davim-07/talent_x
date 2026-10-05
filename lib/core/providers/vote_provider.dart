import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/data/repositories/vote_repository_impl.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/entities/jury_rank.dart';
import 'package:talent_x/core/domain/entities/vote.dart';
import 'package:talent_x/core/domain/repositorires/vote_repository.dart';
import 'core_providers.dart';

/// Provider du repository des votes et classements jury
final voteRepositoryProvider = Provider<VoteRepository>((ref) {
  final localDS = ref.watch(localDataSourceProvider);
  final remoteDS = ref.watch(remoteDataSourceProvider);
  return VoteRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
});

/// Stream de tous les votes enregistrés
final allVotesStreamProvider = StreamProvider<List<Vote>>((ref) {
  final repo = ref.watch(voteRepositoryProvider);
  return repo.getVotesForArtist();
});

/// Stream des votes pour une compétition spécifique
final votesForCompetitionStreamProvider =
    StreamProvider.family<List<Vote>, String>((ref, competitionId) {
  final repo = ref.watch(voteRepositoryProvider);
  return repo.getVotesForCompetition(competitionId);
});

/// Stream des notations du jury pour une compétition
final allJuryRanksStreamProvider =
    StreamProvider.family<List<JuryRank>, String>((ref, competitionId) {
  final repo = ref.watch(voteRepositoryProvider);
  return repo.getAllJuryRanks(competitionId);
});

/// Stream du Top 10 final calculé à partir de la moyenne des jurys
final finalTop10StreamProvider =
    StreamProvider.family<List<Artist>, String>((ref, competitionId) {
  final repo = ref.watch(voteRepositoryProvider);
  return repo.getFinalTop10(competitionId);
});

/// Vérifie si l'utilisateur courant a déjà voté pour cet artiste dans cette compétition
class VoteCheckParams {
  final String artistId;
  final String competitionId;
  const VoteCheckParams({required this.artistId, required this.competitionId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteCheckParams &&
          runtimeType == other.runtimeType &&
          artistId == other.artistId &&
          competitionId == other.competitionId;

  @override
  int get hashCode => artistId.hashCode ^ competitionId.hashCode;
}

final hasAlreadyVotedProvider =
    FutureProvider.family<bool, VoteCheckParams>((ref, params) {
  final repo = ref.watch(voteRepositoryProvider);
  return repo.hasAlreadyVoted(
    artistId: params.artistId,
    competitionId: params.competitionId,
  );
});

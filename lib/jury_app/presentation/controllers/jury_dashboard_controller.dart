import 'package:flutter_riverpod/flutter_riverpod.dart';

class JuryParticipant {
  final String id;
  final int indexNumber;
  final String name;
  final String category;
  final String description;
  final String candidateNumber;
  final int age;
  final bool isEvaluated;
  final double? score;

  JuryParticipant({
    required this.id,
    required this.indexNumber,
    required this.name,
    required this.category,
    required this.description,
    required this.candidateNumber,
    required this.age,
    this.isEvaluated = false,
    this.score,
  });
}

class JuryDashboardState {
  final bool isLoading;
  final String searchQuery;
  final int totalParticipants;
  final int evaluatedCount;
  final int pendingCount;
  final int topFinalists;
  final List<JuryParticipant> participants;

  JuryDashboardState({
    this.isLoading = false,
    this.searchQuery = '',
    required this.totalParticipants,
    required this.evaluatedCount,
    required this.pendingCount,
    required this.topFinalists,
    required this.participants,
  });

  JuryDashboardState copyWith({
    bool? isLoading,
    String? searchQuery,
    int? totalParticipants,
    int? evaluatedCount,
    int? pendingCount,
    int? topFinalists,
    List<JuryParticipant>? participants,
  }) {
    return JuryDashboardState(
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      totalParticipants: totalParticipants ?? this.totalParticipants,
      evaluatedCount: evaluatedCount ?? this.evaluatedCount,
      pendingCount: pendingCount ?? this.pendingCount,
      topFinalists: topFinalists ?? this.topFinalists,
      participants: participants ?? this.participants,
    );
  }
}

final juryDashboardControllerProvider =
    StateNotifierProvider<JuryDashboardController, JuryDashboardState>((ref) {
  return JuryDashboardController();
});

class JuryDashboardController extends StateNotifier<JuryDashboardState> {
  JuryDashboardController()
      : super(JuryDashboardState(
          totalParticipants: 24,
          evaluatedCount: 12,
          pendingCount: 12,
          topFinalists: 10,
          participants: [
            JuryParticipant(
              id: '1',
              indexNumber: 1,
              name: 'Aisha B.',
              category: 'Chant',
              description: 'Chanteuse & Auteure',
              candidateNumber: 'N° 2025-001',
              age: 23,
            ),
            JuryParticipant(
              id: '2',
              indexNumber: 2,
              name: 'Kevin M.',
              category: 'Danse',
              description: 'Danseur Hip-Hop',
              candidateNumber: 'N° 2025-002',
              age: 21,
            ),
            JuryParticipant(
              id: '3',
              indexNumber: 3,
              name: 'Eric N.',
              category: 'Humour',
              description: 'Humoriste / Stand-up',
              candidateNumber: 'N° 2025-003',
              age: 24,
            ),
            JuryParticipant(
              id: '4',
              indexNumber: 4,
              name: 'Grace U.',
              category: 'Musique',
              description: 'Guitariste & Chanteuse',
              candidateNumber: 'N° 2025-004',
              age: 22,
            ),
            JuryParticipant(
              id: '5',
              indexNumber: 5,
              name: 'Daniel K.',
              category: 'Chant',
              description: 'Chanteur Gospel',
              candidateNumber: 'N° 2025-005',
              age: 20,
            ),
            JuryParticipant(
              id: '6',
              indexNumber: 6,
              name: 'Naomi T.',
              category: 'Danse',
              description: 'Danseuse Contemporaine',
              candidateNumber: 'N° 2025-006',
              age: 19,
            ),
          ],
        ));

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
}
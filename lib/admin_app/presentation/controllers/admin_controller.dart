import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AdminTab { dashboard, creation }

class AdminState {
  final AdminTab currentTab;
  final int totalCompetitions;
  final int totalParticipants;
  final int totalEvaluations;
  final int activeCompetitions;
  final bool isVisibleOnPlatform;

  AdminState({
    this.currentTab = AdminTab.dashboard,
    this.totalCompetitions = 6,
    this.totalParticipants = 248,
    this.totalEvaluations = 56,
    this.activeCompetitions = 12,
    this.isVisibleOnPlatform = true,
  });

  AdminState copyWith({
    AdminTab? currentTab,
    int? totalCompetitions,
    int? totalParticipants,
    int? totalEvaluations,
    int? activeCompetitions,
    bool? isVisibleOnPlatform,
  }) {
    return AdminState(
      currentTab: currentTab ?? this.currentTab,
      totalCompetitions: totalCompetitions ?? this.totalCompetitions,
      totalParticipants: totalParticipants ?? this.totalParticipants,
      totalEvaluations: totalEvaluations ?? this.totalEvaluations,
      activeCompetitions: activeCompetitions ?? this.activeCompetitions,
      isVisibleOnPlatform: isVisibleOnPlatform ?? this.isVisibleOnPlatform,
    );
  }
}

final adminControllerProvider =
    StateNotifierProvider<AdminController, AdminState>((ref) {
  return AdminController();
});

class AdminController extends StateNotifier<AdminState> {
  AdminController() : super(AdminState());

  void setTab(AdminTab tab) {
    state = state.copyWith(currentTab: tab);
  }

  void toggleVisibility(bool value) {
    state = state.copyWith(isVisibleOnPlatform: value);
  }
}
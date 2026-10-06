import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/shared_entinties/user_profile.dart';

// Définition des rôles utilisateurs
enum UserRole { artist, jury, admin }

// Classe représentant l'état de l'authentification
class AuthState {
  final UserRole selectedRole;
  final bool rememberMe;
  final bool acceptTerms;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final bool isLoading;
  final String? errorMessage;

  AuthState({
    this.selectedRole = UserRole.artist,
    this.rememberMe = false,
    this.acceptTerms = false,
    this.isPasswordObscured = true,
    this.isConfirmPasswordObscured = true,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    UserRole? selectedRole,
    bool? rememberMe,
    bool? acceptTerms,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      rememberMe: rememberMe ?? this.rememberMe,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured:
          isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

// Provider de profil de l'utilisateur connecté
final currentUserProfileProvider = StateProvider<UserProfile?>((ref) => null);

// Controller moderne basé sur Notifier
class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  void selectRole(UserRole role) {
    state = state.copyWith(selectedRole: role);
  }

  void toggleRememberMe(bool? value) {
    state = state.copyWith(rememberMe: value ?? false);
  }

  void toggleAcceptTerms(bool? value) {
    state = state.copyWith(acceptTerms: value ?? false);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordObscured: !state.isPasswordObscured);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
        isConfirmPasswordObscured: !state.isConfirmPasswordObscured);
  }

  // Connexion de l'utilisateur avec enregistrement de session
  Future<void> login(BuildContext context, {String email = ''}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // Configuration de l'utilisateur courant selon le rôle sélectionné
      final UserProfile profile;

      switch (state.selectedRole) {
        case UserRole.artist:
          profile = UserProfile(
            uid: 'art_1',
            email: email.isNotEmpty ? email : 'achille@talentx.com',
            fullName: 'Achille M.',
            country: 'Burundi',
            province: 'Bujumbura',
            district: 'Mukaza',
            artCategory: 'Danse',
            role: 'artist',
            medals: ['Or - Battle 2025'],
          );
          ref.read(currentUserProfileProvider.notifier).state = profile;
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/artist_app');
          }
          break;

        case UserRole.jury:
          profile = UserProfile(
            uid: 'jury_1',
            email: email.isNotEmpty ? email : 'jury@talentx.com',
            fullName: 'Jury Principal',
            country: 'Burundi',
            province: 'Bujumbura',
            district: 'Mukaza',
            artCategory: 'Evaluation',
            role: 'jury',
            assignedCompetitionId: 'comp_battle_2026',
          );
          ref.read(currentUserProfileProvider.notifier).state = profile;
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/jury_app');
          }
          break;

        case UserRole.admin:
          profile = UserProfile(
            uid: 'admin_1',
            email: email.isNotEmpty ? email : 'admin@talentx.com',
            fullName: 'Administrateur TalentX',
            country: 'Burundi',
            province: 'Bujumbura',
            district: 'Mukaza',
            artCategory: 'Administration',
            role: 'admin',
          );
          ref.read(currentUserProfileProvider.notifier).state = profile;
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/admin_app');
          }
          break;
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // Déconnexion de l'utilisateur
  void logout(BuildContext context) {
    ref.read(currentUserProfileProvider.notifier).state = null;
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  // Inscription d'un nouvel utilisateur (artiste par défaut)
  Future<void> register(
    BuildContext context, {
    required String nom,
    required String prenom,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    // Validation des champs
    if (nom.isEmpty || prenom.isEmpty || email.isEmpty || password.isEmpty) {
      state = state.copyWith(errorMessage: 'Veuillez remplir tous les champs obligatoires.');
      return;
    }
    if (password != confirmPassword) {
      state = state.copyWith(errorMessage: 'Les mots de passe ne correspondent pas.');
      return;
    }
    if (!state.acceptTerms) {
      state = state.copyWith(errorMessage: 'Vous devez accepter les conditions d\'utilisation.');
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // Création du profil utilisateur (artiste par défaut à l'inscription)
      final profile = UserProfile(
        uid: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        fullName: '$prenom $nom',
        country: 'Burundi',
        province: '',
        district: '',
        artCategory: 'Général',
        role: 'artist',
      );

      ref.read(currentUserProfileProvider.notifier).state = profile;

      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/artist_app', (route) => false);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

// Déclaration du Provider moderne
final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});
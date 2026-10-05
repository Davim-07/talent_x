import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Définition des rôles utilisateurs
enum UserRole { artist, jury, admin }

// Classe représentant l'état
class AuthState {
  final UserRole selectedRole;
  final bool rememberMe;
  final bool acceptTerms;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;

  AuthState({
    this.selectedRole = UserRole.artist,
    this.rememberMe = false,
    this.acceptTerms = false,
    this.isPasswordObscured = true,
    this.isConfirmPasswordObscured = true,
  });

  AuthState copyWith({
    UserRole? selectedRole,
    bool? rememberMe,
    bool? acceptTerms,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      rememberMe: rememberMe ?? this.rememberMe,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured: isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
    );
  }
}

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
    state = state.copyWith(isConfirmPasswordObscured: !state.isConfirmPasswordObscured);
  }

  // Redirection selon le rôle sélectionné
  void login(BuildContext context) {
    print("Connexion en cours pour : ${state.selectedRole}");

    switch (state.selectedRole) {
      case UserRole.artist:
        Navigator.of(context).pushReplacementNamed('/artist_app');
        break;
      case UserRole.jury:
        Navigator.of(context).pushReplacementNamed('/jury_app');
        break;
      case UserRole.admin:
        Navigator.of(context).pushReplacementNamed('/admin_app');
        break;
    }
  }
}

// Déclaration du Provider moderne
final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});
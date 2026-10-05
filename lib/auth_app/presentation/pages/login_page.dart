import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/role_selector_card.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF080915),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo TalentX
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'X ', style: TextStyle(color: Color(0xFFD91484))),
                        TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                        TextSpan(text: 'X', style: TextStyle(color: Color(0xFF8A2BE2))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Découvre  •  Évalue  •  Révèle',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const SizedBox(height: 24),

              // Titre
              const Text(
                'Bon retour !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Connectez-vous à votre compte\npour continuer.',
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
              const SizedBox(height: 24),

              // Cartes de sélection de Rôle
              Row(
                children: [
                  Expanded(
                    child: RoleSelectorCard(
                      title: 'Artiste',
                      icon: Icons.mic,
                      role: UserRole.artist,
                      isSelected: state.selectedRole == UserRole.artist,
                      onTap: () => controller.selectRole(UserRole.artist),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RoleSelectorCard(
                      title: 'Membre de jury',
                      icon: Icons.gavel,
                      role: UserRole.jury,
                      isSelected: state.selectedRole == UserRole.jury,
                      onTap: () => controller.selectRole(UserRole.jury),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RoleSelectorCard(
                      title: 'Administrateur',
                      icon: Icons.security,
                      role: UserRole.admin,
                      isSelected: state.selectedRole == UserRole.admin,
                      onTap: () => controller.selectRole(UserRole.admin),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Formulaire de connexion
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1026),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF8A2BE2).withValues(alpha: 0.3)),
                ),
                child: Column(
                  children: [
                    const AuthInputField(
                      label: 'Adresse e-mail',
                      hint: 'exemple@talentx.com',
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 14),
                    AuthInputField(
                      label: 'Mot de passe',
                      hint: 'Entrez votre mot de passe',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isObscured: state.isPasswordObscured,
                      onToggleObscure: controller.togglePasswordVisibility,
                    ),
                    const SizedBox(height: 12),

                    // Options Checkbox et Mot de passe oublié
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: state.rememberMe,
                                onChanged: controller.toggleRememberMe,
                                activeColor: const Color(0xFF8A2BE2),
                                side: const BorderSide(color: Colors.white38),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Se souvenir de moi', style: TextStyle(color: Colors.white70, fontSize: 11)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text('Mot de passe oublié ?', style: TextStyle(color: Color(0xFFA855F7), fontSize: 11)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Bouton Se Connecter
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6B11A8), Color(0xFFFF5722)],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () => controller.login(context),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Se connecter', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Lien Créer un compte
              Center(
                child: Column(
                  children: [
                    const Text('Vous n\'avez pas de compte ?', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Text(
                        'Créer un compte',
                        style: TextStyle(color: Color(0xFFA855F7), fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
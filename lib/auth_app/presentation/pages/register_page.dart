import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_input_field.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

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
              // Bouton Retour & Logo
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF131429),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'X ', style: TextStyle(color: Color(0xFFD91484))),
                        TextSpan(text: 'Talent', style: TextStyle(color: Colors.white)),
                        TextSpan(text: 'X', style: TextStyle(color: Color(0xFF8A2BE2))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Titre
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Créer un ', style: TextStyle(color: Colors.white)),
                    TextSpan(text: 'compte', style: TextStyle(color: Color(0xFFFF5722))),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Rejoignez TalentX et faites partie\nde la communauté.',
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
              const SizedBox(height: 20),

              // Formulaire d'inscription
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
                      label: 'Nom',
                      hint: 'Entrez votre nom',
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 12),
                    const AuthInputField(
                      label: 'Prénom',
                      hint: 'Entrez votre prénom',
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 12),
                    const AuthInputField(
                      label: 'Numéro de téléphone',
                      hint: 'Ex. 68 38 88 01',
                      prefixIcon: Icons.phone_outlined,
                      isPhone: true,
                    ),
                    const SizedBox(height: 12),
                    const AuthInputField(
                      label: 'Email',
                      hint: 'Entrez votre adresse e-mail',
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 12),
                    AuthInputField(
                      label: 'Mot de passe',
                      hint: 'Créez un mot de passe',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isObscured: state.isPasswordObscured,
                      onToggleObscure: controller.togglePasswordVisibility,
                    ),
                    const SizedBox(height: 12),
                    AuthInputField(
                      label: 'Confirmer le mot de passe',
                      hint: 'Répétez votre mot de passe',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isObscured: state.isConfirmPasswordObscured,
                      onToggleObscure: controller.toggleConfirmPasswordVisibility,
                    ),
                    const SizedBox(height: 14),

                    // Conditions d'utilisation
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: state.acceptTerms,
                            onChanged: controller.toggleAcceptTerms,
                            activeColor: const Color(0xFF8A2BE2),
                            side: const BorderSide(color: Colors.white38),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.white70, fontSize: 10),
                              children: [
                                TextSpan(text: 'J\'accepte les '),
                                TextSpan(
                                  text: 'Conditions d\'utilisation',
                                  style: TextStyle(color: Color(0xFFA855F7), fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' et la '),
                                TextSpan(
                                  text: 'Politique de confidentialité',
                                  style: TextStyle(color: Color(0xFFA855F7), fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' de TalentX.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Bouton Créer mon compte
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
                            Icon(Icons.person_add_alt, color: Colors.white, size: 18),
                            SizedBox(width: 8),
                            Text('Créer mon compte', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Déjà un compte
              Center(
                child: Column(
                  children: [
                    const Text('Déjà un compte ?', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Se connecter',
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/admin_controller.dart';

class AdminCreationTab extends ConsumerWidget {
  const AdminCreationTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminControllerProvider);
    final controller = ref.read(adminControllerProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre Formulaire
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF8A2BE2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Créer une compétition',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Remplissez les informations ci-dessous pour lancer\nune nouvelle compétition sur TalentX.',
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Section 1 : Informations Générales
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131429),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.assignment, color: Colors.white70, size: 16),
                    SizedBox(width: 8),
                    Text('1. Informations générales', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Divider(color: Colors.white12, height: 24),

                _buildInputField(
                  label: 'Nom de la compétition *',
                  hint: 'Ex : TalentX 2025',
                  icon: Icons.emoji_events_outlined,
                ),
                const SizedBox(height: 14),

                _buildInputField(
                  label: 'Description *',
                  hint: 'Décrivez la compétition, les objectifs, les règles...',
                  icon: Icons.description_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: _buildInputField(
                        label: 'Date de début *',
                        hint: '12/08/2025',
                        icon: Icons.calendar_today,
                        suffixIcon: Icons.calendar_month,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInputField(
                        label: 'Date de fin *',
                        hint: '15/08/2025',
                        icon: Icons.calendar_today,
                        suffixIcon: Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                _buildDropdownField(
                  label: 'Lieu / Mode *',
                  value: 'En présentiel',
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 14),

                _buildDropdownField(
                  label: 'Catégorie principale *',
                  value: 'Chant',
                  icon: Icons.local_offer_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Section 2 : Visuel de la compétition
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131429),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.image_outlined, color: Colors.white70, size: 16),
                    SizedBox(width: 8),
                    Text('Visuel de la compétition', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.5), style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF1A1C38),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate_outlined, color: Colors.white70, size: 28),
                            SizedBox(height: 4),
                            Text('Ajouter une image', style: TextStyle(color: Colors.white, fontSize: 11)),
                            Text('PNG, JPG (max 5 Mo)', style: TextStyle(color: Colors.white38, fontSize: 9)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage('https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Toggle visibilité
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.visibility_outlined, color: Colors.white70, size: 18),
                        SizedBox(width: 8),
                        Text('Compétition visible sur la plateforme', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    Switch(
                      value: state.isVisibleOnPlatform,
                      onChanged: controller.toggleVisibility,
                      activeThumbColor: Colors.purpleAccent,
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Bouton Créer
                Container(
                  width: double.infinity,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8A2BE2), Color(0xFFFF5722)],
                    ),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: Colors.white, size: 16),
                    label: const Text('Créer la compétition', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    IconData? suffixIcon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 12),
            prefixIcon: Icon(icon, color: Colors.white38, size: 18),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.white38, size: 18) : null,
            filled: true,
            fillColor: const Color(0xFF0D0E1E),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF0D0E1E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white38, size: 18),
              const SizedBox(width: 12),
              Expanded(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 12))),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white38),
            ],
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../controllers/profile_controller.dart';
import '../widgets/wallet_shortcut_card.dart'; // Importation du nouveau composant

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _controller = ProfileController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = _controller.profile;

    return Scaffold(
      backgroundColor: const Color(0xFF070514),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF161426),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text(
          'Profil Artiste',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF161426),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.white, size: 18),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: _controller.isLoading || profile == null
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF8A30FF)))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  // Section Avatar
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF8A30FF), Color(0xFFFF5A1F)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 54,
                            backgroundColor: const Color(0xFF161426),
                            child: profile.avatarUrl.isEmpty
                                ? const Icon(Icons.person, color: Colors.white, size: 40)
                                : ClipOval(
                                    child: Image.network(
                                      profile.avatarUrl,
                                      fit: BoxFit.cover,
                                      width: 108,
                                      height: 108,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.person, color: Colors.white, size: 40),
                                    ),
                                  ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF5A1F),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.star, color: Colors.white, size: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Nom & Rôle
                  Text(
                    profile.name,
                    style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.role,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  
                  // Icône Ondes Sonores Stylisée
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 4,
                        height: (index % 2 == 0) ? 20 : 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5A1F),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Grille des Statistiques (Abonnés, Votes, Prestations)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF100E26),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF1D1A3D)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn(profile.followersCount, 'Abonnés', Icons.people),
                        _buildStatDivider(),
                        _buildStatColumn(profile.votesCount, 'Votes', Icons.how_to_vote),
                        _buildStatDivider(),
                        _buildStatColumn('${profile.performancesCount}', 'Prestations', Icons.music_note),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // INTEGRATION DU COMPOSANT PORTESFEUILLE (Placé stratégiquement ici)
                  WalletShortcutCard(
                    balance: "250 000 XAF", 
                    onDetailsPressed: () {
                      // Action pour naviguer vers l'onglet Portefeuille
                    },
                  ),
                  const SizedBox(height: 24),

                  // Section Biographie
                  _buildSectionHeader('Biographie'),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF100E26),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      profile.biography,
                      style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Section Mes prestations CORRIGÉE
                  _buildSectionHeader('Mes prestations'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPrestationCard('Vokal Star', false),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildPrestationCard('Audition Finale', true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Réseaux Sociaux
                  Row(
                    children: [
                      Expanded(child: _buildSocialButton('Spotify', Colors.green, Icons.library_music)),
                      const SizedBox(width: 14),
                      Expanded(child: _buildSocialButton('YouTube', Colors.red, Icons.play_circle_filled)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Section Galerie
                  _buildSectionHeader('Galerie'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: profile.galleryUrls.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            profile.galleryUrls[index],
                            width: 120,
                            fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  color: const Color(0xFF161426),
                  child: const Icon(Icons.image, color: Colors.grey),
                  ),
                  ),
                  );
                  },
                  ),
                  ),
                  ],
                  ),
                  ),
                  );
                  }
                  Widget _buildSectionHeader(String title) {
                  return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.gesture, color: Color(0xFF8A30FF), size: 20),
                  ],
                  );
                  }
                  Widget _buildStatColumn(String val, String title, IconData icon) {
                  return Column(
                  children: [
                  Icon(icon, color: const Color(0xFFFF5A1F), size: 20),
                  const SizedBox(height: 6),
                  Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                  );
                  }
                  Widget _buildStatDivider() {
                  return Container(width: 1, height: 40, color: const Color(0xFF1D1A3D));
                  }
                  Widget _buildPrestationCard(String title, bool isOrangeTheme) {
                  return Container(
                  height: 90,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: isOrangeTheme
                  ? [const Color(0xFFFF5A1F), const Color(0xFF9E3613)]
                  : [const Color(0xFF8A30FF), const Color(0xFF451994)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                  alignment: Alignment.center,
                  children: [
                  const Icon(Icons.play_circle_outline, color: Colors.white30, size: 36),
                  Positioned(
                  bottom: 10,
                  left: 12,
                  child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  ),
                  ],
                  ),
                  );
                  }
                  Widget _buildSocialButton(String label, Color iconColor, IconData icon) {
                  return Container(
                  height: 44,
                  decoration: BoxDecoration(
                  color: const Color(0xFF100E26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1D1A3D)),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(icon, color: iconColor, size: 18),
                  const SizedBox(width: 8),
                  Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                  ],
                  ),
                  );
                  }
                  }
import 'package:flutter/material.dart';
import '../controllers/vote_controller.dart';
import '../widgets/vote_button_widget.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  final VoteController _controller = VoteController();

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

  void _showTopSuccessNotification(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 60,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8A30FF), Color(0xFFFF5A1F)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  // FIX : Remplacement de withOpacity par withValues
                  color: const Color(0xFFFF5A1F).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Vote validé avec succès ! 🎉',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Merci de soutenir la culture et propulser nos jeunes talents !',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(milliseconds: 3500), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'TalentX',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white), 
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Voter',
              style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161426),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vokal Star: Auditions',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Votez pour votre artiste préféré avant le 30 nov.',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.candidates.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final candidate = _controller.candidates[index];
                      final isSelected = _controller.selectedCandidateId == candidate.id;

                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFF8A30FF),
                            child: candidate.imageUrl.isEmpty 
                                ? const Icon(Icons.person, color: Colors.white, size: 28)
                                : ClipOval(
                                    child: Image.network(
                                      candidate.imageUrl, 
                                      fit: BoxFit.cover,
                                      width: 52,
                                      height: 52,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.person, color: Colors.white, size: 28);
                                      },
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  candidate.name,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  candidate.role,
                                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          VoteButton(
                            isSelected: isSelected,
                            onPressed: () => _controller.selectCandidate(candidate.id),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            if (_controller.selectedCandidateId != null) ...[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8A30FF), Color(0xFFFF5A1F)],
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: ElevatedButton(
                  onPressed: _controller.isLoading ? null : () async {
                    final success = await _controller.confirmVote();
                    
                    if (success && mounted) {
                      // FIX : ignore use_build_context_synchronously supprime la ligne bleue définitivement
                      // ignore: use_build_context_synchronously
                      _showTopSuccessNotification(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  ),
                  child: _controller.isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('CONFIRMER MON VOTE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
            ],

            const SizedBox(height: 28),
            
            const Text(
              "Critères d'Évaluation",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCriterionRow("Technique Vocale", 0.30, "30%"),
            _buildCriterionRow("Originalité", 0.20, "20%"),
            _buildCriterionRow("Présence Scénique", 0.15, "15%"),
                    ],
                  ),
                ),
              );
            }

          Widget _buildCriterionRow(String title, double progress, String percentage) {
          return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Text(percentage, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
          builder: (context, constraints) {
          return Stack(
          children: [
          Container(
          width: constraints.maxWidth,
          height: 6,
          decoration: BoxDecoration(
          color: const Color(0xFF1D1B30),
          borderRadius: BorderRadius.circular(3),
          ),
          ),
          ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFF8A30FF), Color(0xFFFF5A1F)],
          ).createShader(bounds),
          child: Container(
          width: constraints.maxWidth * progress,
          height: 6,
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          ),
          ),
          ),
          ],
          );
          },
          ),
          ],
          ),
          );
          }
          }

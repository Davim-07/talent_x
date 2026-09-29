import 'package:flutter/material.dart';

class WalletShortcutCard extends StatelessWidget {
  final String balance;
  final VoidCallback onDetailsPressed;

  const WalletShortcutCard({
    super.key,
    required this.balance,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Dégradé violet/bleu nuit profond assorti au thème de l'application
        gradient: const LinearGradient(
          colors: [Color(0xFF1F1A42), Color(0xFF120E2B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2C2559)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF070514).withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icône Portefeuille Stylisé
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF8A30FF).withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF8A30FF).withValues(alpha: 0.3)),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Color(0xFF8A30FF),
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          
          // Informations du Solde
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mon Portefeuille',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  balance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Bouton d'action fléché (Raccourci vers la page Portefeuille)
          IconButton(
            onPressed: onDetailsPressed,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white70,
              size: 16,
            ),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF1D1A3D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}

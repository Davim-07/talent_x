import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isObscured;
  final VoidCallback? onToggleObscure;
  final bool isPhone;

  const AuthInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.isObscured = false,
    this.onToggleObscure,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF131429),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(prefixIcon, color: Colors.white54, size: 20),
              const SizedBox(width: 12),
              if (isPhone) ...[
                // Drapeau et indicatif Burundi +257
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    children: [
                      Text('🇧🇮', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 4),
                      Text('+257', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_drop_down, color: Colors.white70, size: 16),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: TextField(
                  obscureText: isPassword && isObscured,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (isPassword)
                GestureDetector(
                  onTap: onToggleObscure,
                  child: Icon(
                    isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.white54,
                    size: 20,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../controllers/admin_controller.dart';

class AdminTopTabSwitch extends StatelessWidget {
  final AdminTab currentTab;
  final ValueChanged<AdminTab> onTabChanged;

  const AdminTopTabSwitch({
    super.key,
    required this.currentTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF131429),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              title: 'Dashboard',
              icon: Icons.grid_view_rounded,
              isSelected: currentTab == AdminTab.dashboard,
              onTap: () => onTabChanged(AdminTab.dashboard),
            ),
          ),
          Expanded(
            child: _buildTabButton(
              title: 'Création',
              icon: Icons.add_circle,
              isSelected: currentTab == AdminTab.creation,
              onTap: () => onTabChanged(AdminTab.creation),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF6B11A8), Color(0xFF261168)],
                )
              : null,
          color: isSelected ? null : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white38,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white38,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
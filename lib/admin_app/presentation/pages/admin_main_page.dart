import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/admin_controller.dart';
import '../widgets/admin_header_app_bar.dart';
import '../widgets/admin_top_tab_switch.dart';
import 'admin_creation_tab.dart';
import 'admin_dashboard_tab.dart';

class AdminMainPage extends ConsumerWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminControllerProvider);
    final controller = ref.read(adminControllerProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AdminHeaderAppBar(
        subtitle: state.currentTab == AdminTab.dashboard
            ? 'Gérez les compétitions et les utilisateurs'
            : 'Créez les compétitions et les utilisateurs',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: AdminTopTabSwitch(
              currentTab: state.currentTab,
              onTabChanged: controller.setTab,
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: state.currentTab == AdminTab.dashboard ? 0 : 1,
              children: const [
                AdminDashboardTab(),
                AdminCreationTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF090A16),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.white38,
        currentIndex: state.currentTab == AdminTab.dashboard ? 0 : 1,
        onTap: (index) {
          controller.setTab(index == 0 ? AdminTab.dashboard : AdminTab.creation);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Création',
          ),
        ],
      ),
    );
  }
}
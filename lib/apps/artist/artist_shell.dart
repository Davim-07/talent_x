import 'package:flutter/material.dart';

class ArtistShell extends StatefulWidget {
  const ArtistShell({super.key});

  @override
  State<ArtistShell> createState() => _ArtistShellState();
}

class _ArtistShellState extends State<ArtistShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('1. Catalogue / Accueil')),
    Center(child: Text('2. Liste des Compétitions')),
    Center(child: Text('3. Zone de Vote')),
    Center(child: Text('4. Classement Top 500')),
    Center(child: Text('5. Profil Artiste')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Catalogue'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Compétitions'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote), label: 'Vote'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Classement'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
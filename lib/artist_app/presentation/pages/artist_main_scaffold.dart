import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/artist_navigation_controller.dart';
import '../widgets/artist_bottom_nav_bar.dart';
import 'artist_home_page.dart';
import 'artist_competition_page.dart';
import 'artist_vote_page.dart';
import 'artist_ranking_page.dart';
import 'artist_profile_page.dart';

class ArtistMainScaffold extends ConsumerWidget {
  const ArtistMainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(artistTabProvider);

    const List<Widget> pages = [
      ArtistHomePage(),
      ArtistCompetitionPage(),
      ArtistVotePage(),
      ArtistRankingPage(),
      ArtistProfilePage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF12122A),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: ArtistBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => ref.read(artistTabProvider.notifier).state = index,
      ),
    );
  }
}
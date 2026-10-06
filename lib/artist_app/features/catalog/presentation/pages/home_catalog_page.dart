import 'package:flutter/material.dart';
import 'package:talent_x/artist_app/features/catalog/presentation/widgets/big_event_card.dart';
import 'package:talent_x/artist_app/features/catalog/presentation/widgets/featured_artist_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('TalentX'),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
        ]
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Column(
        children: [
        Expanded(
          flex: 1,
          child: BigEventCard(),),
        Expanded(
          flex: 1,
          child: FeaturedArtistCard(),),
      ],) 
    );
  }
}

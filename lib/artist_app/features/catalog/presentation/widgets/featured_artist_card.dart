import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/artist_app/features/catalog/presentation/controllers/catalog_controller.dart';

class FeaturedArtistCard extends ConsumerWidget {
  const FeaturedArtistCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(catalogRepositoryProvider).sortByName();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: artists.length,
      itemBuilder: (context, index){
        return Card(
          color: Theme.of(context).cardTheme.color,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    ),
                  ),
                  child: Image.network(artists[index].imageUrl)
                ),
                const Spacer(),
                Text(artists[index].name),
                const Spacer(),
                Text(artists[index].category, style: const TextStyle(color: Colors.grey, fontSize: 20,)),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: null,
                  child: const Text('VOTE'),
                ),
              ],
            )
          ),
        );
      }
    );
  }
}

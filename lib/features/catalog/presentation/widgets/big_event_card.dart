import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/features/catalog/presentation/controllers/catalog_controller.dart';

class BigEventCard extends ConsumerWidget {
  const BigEventCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogRepository = ref.watch(catalogRepositoryProvider);
    final bigEvents = catalogRepository.sortByDate();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              bigEvents[0].imageUrl,
              width: 400,
              height: 300,
              fit: BoxFit.cover,
              cacheWidth: 800,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 64, color: Colors.grey),
            ),
            Text(bigEvents[0].title),
          ],
        ),
      ),
    );
  }
}

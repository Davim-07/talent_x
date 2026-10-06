import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSeeder {
  static Future<void> seedTestData() async {
    final db = FirebaseFirestore.instance;

    // 1. Inserer les compétitions
    await db.collection('competitions').doc('comp_01').set({
      'id': 'comp_01',
      'title': 'Grand Prix Spécial Chant 2026',
      'category': 'Chant',
      'description': 'La plus grande compétition de chant de la saison.',
      'imageUrl': 'https://picsum.photos/seed/sing/400/300',
      'deadline': '2026-12-31T23:59:59.000Z',
    });

    await db.collection('competitions').doc('comp_02').set({
      'id': 'comp_02',
      'title': 'Dance Battle Urban 2026',
      'category': 'Danse',
      'description': 'Affrontement des meilleurs groupes de danse urbaine.',
      'imageUrl': 'https://picsum.photos/seed/dance/400/300',
      'deadline': '2026-11-15T20:00:00.000Z',
    });

    // 2. Inserer les artistes
    await db.collection('artists').doc('artist_01').set({
      'id': 'artist_01',
      'name': 'Aline Niyomwungere',
      'bio': 'Chanteuse de variété R&B et Soul.',
      'imageUrl': 'https://picsum.photos/seed/artist1/300/300',
    });

    await db.collection('artists').doc('artist_02').set({
      'id': 'artist_02',
      'name': 'Urban Crew Dance',
      'bio': 'Groupe de hip-hop et afrobeat.',
      'imageUrl': 'https://picsum.photos/seed/artist2/300/300',
    });

    // 3. Inserer les grands événements
    await db.collection('big_events').doc('talentx_season1').set({
      'title': 'TalentX Saison 1',
      'subtitle': 'La grande finale nationale en direct',
      'imageUrl': 'https://picsum.photos/seed/event1/600/300',
      'createdAt': '2026-10-01T10:00:00.000Z',
    });
  }
}
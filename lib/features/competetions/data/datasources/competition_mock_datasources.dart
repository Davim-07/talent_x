import '../../domain/entities/competition.dart';

class CompetitionMockDataSource {
  List<Competition> getActiveCompetitions() {
    return [
      Competition(
        id: "comp_1",
        title: "Vokal Star: Auditions 2026",
        category: "Chant",
        description: "Révélez la voix d'or de l'Afrique. Participez aux auditions nationales et tentez de gagner la grande finale.",
        imageUrl: "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7",
        participantsCount: 128,
        prize: "5 000 000 BIF",
        deadline: "15 Oct 2026",
        entryFee: 5000,
      ),
      Competition(
        id: "comp_2",
        title: "Battle de Danse Urban Flow",
        category: "Danse",
        description: "Compétition de hip-hop, afrobeat et danse contemporaine. Montrez votre meilleure chorégraphie.",
        imageUrl: "https://images.unsplash.com/photo-1547153760-18fc86324498",
        participantsCount: 84,
        prize: "3 500 000 BIF",
        deadline: "20 Oct 2026",
        entryFee: 3000,
      ),
      Competition(
        id: "comp_3",
        title: "AfroArt: Dessin & Digital Painting",
        category: "Dessin",
        description: "Exprimez la culture africaine à travers vos illustrations traditionnelles ou numériques.",
        imageUrl: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119",
        participantsCount: 56,
        prize: "2 000 000 BIF",
        deadline: "05 Nov 2026",
        entryFee: 2000,
      ),
    ];
  }
}

